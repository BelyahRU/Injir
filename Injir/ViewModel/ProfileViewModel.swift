//
//  ProfileViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 07.02.2024.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class ProfileViewModel {
    public var nameOfUserObservable = Observable<String>("")
    public var professionOfUserObservable = Observable<String>("")
    public let ref = Database.database().reference()
    
    public func setUserName(name: String) {
        
    }
    
    public func getUserName(completion: @escaping (String?) -> Void) {
        ref.child("users/\(Auth.auth().currentUser!.uid)/name").getData { error, snapshot in
            if let error = error {
                print("Error getting data: \(error.localizedDescription)")
                completion(nil)
            } else if let snapshot = snapshot, let value = snapshot.value as? String {
                completion(value)
            } else {
                print("Failed to retrieve user name")
                completion(nil)
            }
        }
    }
    
    public func getProfession(completion: @escaping (String?) -> Void) {
        ref.child("users/\(Auth.auth().currentUser!.uid)/profession/profession").getData { error, snapshot in
            if let error = error {
                print("Error getting data: \(error.localizedDescription)")
                completion(nil)
            } else if let snapshot = snapshot, let value = snapshot.value as? String {
                completion(value)
            } else {
                print("Failed to retrieve profession")
                completion(nil)
            }
        }
    }
    
    //MARK: getting image
    public func getAvatarImage(completion: @escaping (String?) -> Void) {
        ref.child("users/\(Auth.auth().currentUser!.uid)/avatar").observeSingleEvent(of: .value) { snapshot in
            guard let base64String = snapshot.value as? String else {
                completion(nil)
                return
            }
            completion(base64String)
        }
    }
    
    
    public func changeUserName(newUserName: String){
        ref.child("users/\(Auth.auth().currentUser!.uid)/name").setValue(newUserName) { (error, response) in
            if error == nil {
                self.nameOfUserObservable.value = newUserName
                print("OK")
            } else {
                
                print("Проблемы с новым именем, \(error!.localizedDescription)")
            }
        }
    }
    
    public func changeProfession(newProfession: String){
        ref.child("users/\(Auth.auth().currentUser!.uid)/profession/profession").setValue(newProfession) { (error, response) in
            if error == nil {
                self.professionOfUserObservable.value = newProfession
                print("OK")
            } else {
                print("Проблемы с новым именем")
            }
        }
    }
    
    public func changeImage(data: Data) {
        ref.child("users/\(Auth.auth().currentUser!.uid)/avatar").setValue(data.base64EncodedString()) { error, resp in
            if error == nil {
                print("OK")
            } else {
                print("Проблемы с новым аватаром")
            }
        }
    }


}
