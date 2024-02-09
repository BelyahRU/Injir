//
//  UsersData.swift
//  Injir
//
//  Created by Александр Андреев on 07.02.2024.
//

import Foundation

struct User {
    var name: String
    var email: String
    var password: String
    var passportData: PassportData
    var contactData: ContactData
    var registrationAndPatentData: RegistrationAndPatentData
    var profession: ProfessionData
    
    
}

struct PassportData {
    var seriaAndNumber: String = "-"
    var dateOfBirth: String = "-"
    var placeOfBirth: String = "-"
    var dateOfIssue: String = "-"
    var organ: String = "-"
    
    func dictionaryRepresentation() -> [String: String] {
        return [
            "seriaAndNumber": seriaAndNumber,
            "dateOfBirth": dateOfBirth,
            "placeOfBirth": placeOfBirth,
            "dateOfIssue": dateOfIssue,
            "organ": organ
        ]
    }
    
    mutating func setValues(from dictionary: [String: String]) {
           seriaAndNumber = dictionary["seriaAndNumber"] ?? "-"
           dateOfBirth = dictionary["dateOfBirth"] ?? "-"
           placeOfBirth = dictionary["placeOfBirth"] ?? "-"
           dateOfIssue = dictionary["dateOfIssue"] ?? "-"
           organ = dictionary["organ"] ?? "-"
    }
}

struct RegistrationAndPatentData {
    var temporaryRegistration: String  = "-"
    var permanentRegistration: String  = "-"
    var patentRegistration: String  = "-"
    
    func dictionaryRepresentation() -> [String: String] {
        return [
            "temporaryRegistration": temporaryRegistration,
            "permanentRegistration": permanentRegistration,
            "patentRegistration": patentRegistration
        ]
    }
    
    mutating func setValues(from dictionary: [String: String]) {
        temporaryRegistration = dictionary["temporaryRegistration"] ?? "-"
        permanentRegistration = dictionary["permanentRegistration"] ?? "-"
        patentRegistration = dictionary["patentRegistration"] ?? "-"
    }
    
}

struct ContactData {
    var phoneNumber: String = "+79211487521"
    
    func dictionaryRepresentation() -> [String: String] {
        return [
            "phoneNumber": phoneNumber
        ]
    }
}

struct ProfessionData {
    var profession: String = "-"
    
    func dictionaryRepresentation() -> [String: String] {
        return [
            "profession": profession
        ]
    }
}
