//
//  ContactDataViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 08.02.2024.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class ContactDataViewModel {
    let ref = Database.database().reference()
    var email = "-"
    var phoneNumber = ""
    
    public func getEmailData(_ completion: @escaping (String?) -> Void) {
        ref.child("users/\(Auth.auth().currentUser!.uid)/email").getData { error, snapshot in
            if let error = error {
                print("Error with getting email \(error.localizedDescription)")
                completion(nil)
            } else if let snapshot = snapshot, let value = snapshot.value as? String{
                self.setupEmail(email: value)
                completion(self.email)
            } else {
                print("Failed to retrive email")
                completion(nil)
            }
        }
    }
    
    public func getPhoneNumberData(_ completion: @escaping (String?) -> Void) {
        ref.child("users/\(Auth.auth().currentUser!.uid)/contactData/phoneNumber").getData { error, snapshot in
            if let error = error {
                print("Error getting phone number \(error.localizedDescription)")
                completion(nil)
            } else if let snapshot = snapshot, let value = snapshot.value as? String {
                self.changePhoneNumber(newPhone: value)
                completion(self.phoneNumber)
            } else {
                print("Failed to retrive email")
                completion(nil)
            }
        }
    }
    
    public func setupEmail(email: String) {
        self.email = email
    }
    
    public func changePhoneNumber(newPhone: String) {
        self.phoneNumber = newPhone
    }
    
    public func changeDatabase() {
        ref.child("users/\(Auth.auth().currentUser!.uid)/contactData/phoneNumber").setValue(phoneNumber)
    }
    
    
}
