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
    
    public func isCorrectUserInfo() -> String {
        if self.password != self.repeatPassword {
            return "Пароли не совпадают, повторите ввод"
        } else if self.name == "" || self.password == "" ||  self.repeatPassword == "" || self.email == ""{
            return "Не все поля заполнены"
        } else if !(self.email!.contains("@")) {
            return "email заполнен неверно, повторите ввод"
        }
        return "OK"
    }
    
    public func registerUser(completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email!, password: password!, completion: completion)
    }
    
    public func addUserToDatabase(result: AuthDataResult?, error: Error?) -> String{
        if error == nil {
            if let result = result {
                let ref = Database.database().reference().child("users")
                ref.child(result.user.uid).updateChildValues(["name": self.name!, "email": self.email!])
            } else {
                return "Неизвестная ошибка, result"
            }
        } else {
            return "Неизвестная ошибка, error"
        }
        return "OK"
    }
    
    
}
