//
//  PassportDataViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 08.02.2024.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class PassportDataViewModel {
    
    var passportData = PassportData()
    let ref = Database.database().reference()
    
    public func getPassportData(completion: @escaping (PassportData?) -> Void) {
        ref.child("users/\(Auth.auth().currentUser!.uid)/passportData").getData { error, snapshot in
            if let error = error {
                print("Error getting passport data: \(error.localizedDescription)  ")
                completion(nil)
            } else if let snapshot = snapshot, let value = snapshot.value as? [String:String] {
                self.changeData(dict: value)
                completion(self.passportData)
            } else {
                print("Failed to retrive passport data")
                completion(nil)
            }
        }
    }
    
    public func changeData(dict: [String: String]) {
        passportData.setValues(from: dict)
    }
    
    public func changeDatabase() {
        
        ref.child("users/\(Auth.auth().currentUser!.uid)/passportData").setValue(passportData.dictionaryRepresentation())
        
    }
}
extension PassportDataViewModel {
    public func validatePassportData(data: PassportData) -> [String: String] {
        var errors: [String: String] = [:]
        
        // Проверка серии и номера
        if data.seriaAndNumber.isEmpty {
            errors["seriaAndNumber"] = "Укажите серию и номер"
        } else if !isSeriaAndNumberValid(data.seriaAndNumber) {
            errors["seriaAndNumber"] = "Некорректная серия и номер"
        }
        
        // Проверка даты рождения
        if data.dateOfBirth.isEmpty {
            errors["dateOfBirth"] = "Укажите дату рождения"
        } else if !isDateOfBirthValid(data.dateOfBirth) {
            errors["dateOfBirth"] = "Некорректная дата рождения"
        }
        
        // Проверка места рождения
        if data.placeOfBirth.isEmpty {
            errors["placeOfBirth"] = "Укажите место рождения"
        } else if !isValidString(data.placeOfBirth) {
            errors["placeOfBirth"] = "Некорректное место рождения"
        }
        
        // Проверка даты выдачи паспорта
        if data.dateOfIssue.isEmpty {
            errors["dateOfIssue"] = "Укажите дату выдачи паспорта"
        } else if !isDateOfIssueValid(data.dateOfIssue) {
            errors["dateOfIssue"] = "Некорректная дата выдачи паспорта"
        }
        
        // Проверка органа, выдавшего паспорт
        if data.organ.isEmpty {
            errors["organ"] = "Укажите орган, выдавший паспорт"
        } else if !isValidString(data.organ) {
            errors["organ"] = "Некорректный орган, выдавший паспорт"
        }
        
        return errors
    }
    
    private func isSeriaAndNumberValid(_ passportNumber: String) -> Bool {
        let arr = Array(passportNumber)
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
    
    private func isDateOfBirthValid(_ dateOfBirth: String) -> Bool {
        if isDateValid(dateOfBirth) == true {
            guard let birthDate = DateFormatter.dateFormatter.date(from: dateOfBirth),
                  let age = Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year,
                  age >= 18, age <= 125 else {
                return false
            }
            return true
        }
        
        return false
    }
    
    private func isDateOfIssueValid(_ dateOfIssue: String) -> Bool {
        if isDateValid(dateOfIssue) == true {
            guard let issueDate = DateFormatter.dateFormatter.date(from: dateOfIssue),
                  let years = Calendar.current.dateComponents([.year], from: issueDate, to: Date()).year,
                  years <= 80 else {
                return false
            }
            return true
        }
    
        return isDateValid(dateOfIssue)
    }
    
    
    private func isDateValid(_ datee: String) -> Bool {
        let dateFormat = "dd.MM.yyyy"
        let dateFormatter = DateFormatter.dateFormatter
        dateFormatter.dateFormat = dateFormat
        
        if let date = dateFormatter.date(from: datee) {
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate == datee
        } else {
            return false
        }
    }
    
    private func isValidString(_ str: String) -> Bool {
        let allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ, .:-")
        
        return str.rangeOfCharacter(from: allowedCharacterSet.inverted) == nil
    }
}

