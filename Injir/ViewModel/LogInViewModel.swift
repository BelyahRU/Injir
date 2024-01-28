//
//  LogInViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 28.01.2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth

class LogInViewModel {
    
    private var email: String? = ""
    private var password: String? = ""
    
    public func setUserInfo(email: String?, password: String?) {
        self.email = email
        self.password = password
    }
    
    public func isCorrectUserInfo() -> String{
        //add other messages
        if self.password == "" || self.email == ""{
            return "Не все поля заполнены"
        } else if !(self.email!.contains("@")) {
            return "email заполнен неверно, повторите ввод"
        }
        return "OK"
    }
    
    public func logInUser(completion: @escaping (AuthDataResult?, Error?) -> Void) {
        print(self.email!, self.password!)
        Auth.auth().signIn(withEmail: self.email!, password: self.password!, completion: completion)
        print(Auth.auth().currentUser?.email)
    }
}
