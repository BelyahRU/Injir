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
