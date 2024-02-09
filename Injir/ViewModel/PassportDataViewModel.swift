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
