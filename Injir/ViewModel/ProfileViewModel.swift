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
    
    
    public func setUserName(name: String) {
        
    }
    
    public func getUserName(completion: @escaping (String?) -> Void) {
        let ref = Database.database().reference()
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
        let ref = Database.database().reference()
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
    
    public func changeUserName(newUserName: String){
        let ref = Database.database().reference()
        
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
        let ref = Database.database().reference()
        
        ref.child("users/\(Auth.auth().currentUser!.uid)/profession/profession").setValue(newProfession) { (error, response) in
            if error == nil {
                self.professionOfUserObservable.value = newProfession
                print("OK")
            } else {
                print("Проблемы с новым именем")
            }
        }
    }


}
