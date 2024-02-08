//
//  RegistrationViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 28.01.2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class RegistrationViewModel {
    
    private var name: String? = ""
    private var email: String? = ""
    private var password: String? = ""
    private var repeatPassword: String? = ""
    
    
    public func setUserInfo(name: String?, email: String?, password: String?, repeatPassword: String?) {
        self.name = name
        self.email = email
        self.password = password
        self.repeatPassword = repeatPassword
    }
    
    public func getDataError() -> String? {
        //add other errors
        if self.password != self.repeatPassword {
            return "Пароли не совпадают, повторите ввод"
        } else if self.name == "" || self.password == "" ||  self.repeatPassword == "" || self.email == ""{
            return "Не все поля заполнены"
        } else if !(self.email!.contains("@")) {
            return "email заполнен неверно, повторите ввод"
        } else if self.password!.count < 6 {
            return "длинна паспорта должна быть не менее 6 символов"
        }
        return nil
    }
    
    public func registerUser(completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email!, password: password!, completion: completion)
    }
    
    public func addUserToDatabase(result: AuthDataResult?, error: Error?) -> String? {
        guard error == nil else {
            return "Неизвестная ошибка, \(error!.localizedDescription)"
        }
        
        guard let result = result else {
            return "Неизвестная ошибка, result"
        }
        
        let ref = Database.database().reference().child("users")
        
        
        let passportData = createPassportData()
        let contactData = createContactData()
        let registrationAndPatentData = createRegistrationAndPatentData()
        let professionData = createProfessionData()
        
        ref.child(result.user.uid).updateChildValues([
            "name": self.name ?? "",
            "email": self.email ?? "",
            "password": self.password ?? "",
            "profession": professionData,
            "passportData": passportData,
            "contactData": contactData,
            "registrationAndPatentData": registrationAndPatentData
            
        ]) { (error, reference) in
            if let error = error {
                print("Ошибка при обновлении данных: \(error.localizedDescription)")
            } else {
                print("Данные успешно обновлены в базе данных")
            }
        }
        
        return nil
    }
    
    public func logInUser(completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: self.email!, password: self.password!, completion: completion)
    }
    
    public func createPassportData() -> [String: String]{
        let passport = PassportData()
        
        return passport.dictionaryRepresentation()
    }
    
    public func createRegistrationAndPatentData() -> [String: String] {
        let registrationAndPatentData = RegistrationAndPatentData()
        
        return registrationAndPatentData.dictionaryRepresentation()
    }
    
    public func createContactData() -> [String: String] {
        let contactData = ContactData()
        
        return contactData.dictionaryRepresentation()
    }
    
    public func createProfessionData() -> [String: String] {
        let professionData = ProfessionData()
        
        return professionData.dictionaryRepresentation()
    }
    
    
}
