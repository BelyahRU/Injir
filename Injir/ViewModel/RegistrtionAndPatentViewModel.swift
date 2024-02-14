//
//  RegistrtionAndPatentViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 08.02.2024.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class RegistrtionAndPatentViewModel {
    
    var data = RegistrationAndPatentData()
    let ref = Database.database().reference()
    
    
    public func getData(completion: @escaping (RegistrationAndPatentData?) -> Void) {
        ref.child("users/\(Auth.auth().currentUser!.uid)/registrationAndPatentData").getData { error, snapshot in
            if let error = error {
                print("Error getting registration and patent data: \(error.localizedDescription)")
                completion(nil)
            } else if let snapshot = snapshot, let value = snapshot.value as? [String: String] {
                self.changeData(dict: value)
                completion(self.data)
            } else {
                print(error, snapshot)
            }
        }
    }
                      
    public func changeData(dict: [String: String]) {
        data.setValues(from: dict)
    }
    
    public func changeDatabase() {
        ref.child("users/\(Auth.auth().currentUser!.uid)/registrationAndPatentData").setValue(data.dictionaryRepresentation())
    }
}

extension RegistrtionAndPatentViewModel {
    public func validate(data: RegistrationAndPatentData) -> [String: String]{
        var errors: [String: String] = [:]
        if data.permanentRegistration.isEmpty {
            errors["permanentRegistration"] = "Укажите постоянную регистрацию"
        } else if !isValidString(data.permanentRegistration) {
            errors["permanentRegistration"] = "Некорректная постоянная регистрация"
        }
        
        if data.temporaryRegistration.isEmpty {
            errors["temporaryRegistration"] = "Укажите временную регистрацию"
        } else if !isValidString(data.temporaryRegistration) {
            errors["temporaryRegistration"] = "Некорректная временная регистрация"
        }
        
        if data.patentRegistration.isEmpty {
            errors["patentRegistration"] = "Укажите патент"
        } else if !isPatentValid(data.patentRegistration) {
            errors["patentRegistration"] = "Некорректный патент"
        }
        return errors
    }
    
    private func isValidString(_ str: String) -> Bool {
        let allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ, .:-")
        
        return str.rangeOfCharacter(from: allowedCharacterSet.inverted) == nil
    }
    
    private func isPatentValid(_ patent: String) -> Bool {
        let arr = Array(patent)
        var flag = true
        if arr.count == 11 {
            for i in 0...10 {
                if flag == false {
                    break
                }
                
                if i >= 0 && i <= 3 && arr[i].isNumber {
                    flag = true
                } else if i == 4 && arr[i] == "-" {
                    flag = true
                } else if i > 4 && i <= 10 && arr[i].isNumber {
                    flag = true
                } else {
                    flag = false
                }
            }
        } else {
            flag = false
        }
        return flag
    }
}
