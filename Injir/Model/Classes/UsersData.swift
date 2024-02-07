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
    var profession: Profession
}

struct PassportData {
    var seriaAndNumber: String
    var dateOfBirth: String
    var placeOfBirth: String
    var dateOfIssue: String
    var organ: String
}

struct RegistrationAndPatentData {
    var temporaryRegistration: String
    var permanentRegistration: String
    var patentRegistration: String
}

struct ContactData {
    var phoneNumber: String
}

struct Profession {
    var profession: String
}
