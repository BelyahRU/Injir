//
//  PassportDataViewController.swift
//  Injir
//
//  Created by Александр Андреев on 01.02.2024.
//

import UIKit
import FirebaseDatabase

class PassportDataViewController: UIViewController {
    
    private let passportDataView = PassportDataView()
    private let viewModel = PassportDataViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupViewModel()
        setupButtons()
    }
    
    private func setupViewModel() {
        viewModel.getPassportData { passportData in
            if passportData == nil {
                let clearPassportData = PassportData()
                self.setupViewWithData(data: clearPassportData)
            } else {
                self.setupViewWithData(data: passportData!)
            }
        }
    }
    
    private func setupViewWithData(data: PassportData) {
        passportDataView.setupData(data: data)
        
        view.addSubview(passportDataView)
        
        passportDataView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        passportDataView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        passportDataView.editButton.addTarget(self, action: #selector(editPressed(_:)), for: .touchUpInside)
    }

}

//MARK: Actions
extension PassportDataViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func editPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Редактировать" {
            passportDataView.changeEditButton()
        } else {
            if isValidData() {
                clearValidationFields()
                passportDataView.changeOkButton()
                sendNewDataToDatabase()
            } 
        }
    }
}


//MARK: Validation data
extension PassportDataViewController {
    private func clearValidationFields() {
        passportDataView.dataSVs.seriaAndNumberSV.setPurpleBorderColor()
        passportDataView.dataSVs.dateOfBithSV.setPurpleBorderColor()
        passportDataView.dataSVs.dateOfIssueSV.setPurpleBorderColor()
        passportDataView.dataSVs.placeOfBithSV.setPurpleBorderColor()
        passportDataView.dataSVs.organSV.setPurpleBorderColor()
    }
    
    private func isValidData() -> Bool {
        var newPassportData = PassportData()
        newPassportData.setValues(from: getDataFromTFs())
        let errors = viewModel.validatePassportData(data: newPassportData)
        if errors.isEmpty {
            return true
        } else {
            showValidationErrors(errors: errors)
            return false
        }
    }
    
    private func showValidationErrors(errors: [String: String]) {
        let fieldsArray = ["dateOfBirth", "dateOfIssue", "seriaAndNumber", "organ", "placeOfBirth"]
        for i in errors {
            if i.key == "seriaAndNumber" {
                passportDataView.dataSVs.seriaAndNumberSV.errorLabel.text = i.value
                passportDataView.dataSVs.seriaAndNumberSV.setRedBorderColor()
            } else if i.key == "dateOfBirth" {
                passportDataView.dataSVs.dateOfBithSV.errorLabel.text = i.value
                passportDataView.dataSVs.dateOfBithSV.setRedBorderColor()
            } else if i.key == "placeOfBirth" {
                passportDataView.dataSVs.placeOfBithSV.errorLabel.text = i.value
                passportDataView.dataSVs.placeOfBithSV.setRedBorderColor()
            } else if i.key == "dateOfIssue" {
                passportDataView.dataSVs.dateOfIssueSV.errorLabel.text = i.value
                passportDataView.dataSVs.dateOfIssueSV.setRedBorderColor()
            } else if i.key == "organ" {
                passportDataView.dataSVs.organSV.errorLabel.text = i.value
                passportDataView.dataSVs.organSV.setRedBorderColor()
            }
        }
        for i in fieldsArray {
            if errors.keys.contains(i) == false {
                if i == "seriaAndNumber" {
                    passportDataView.dataSVs.seriaAndNumberSV.errorLabel.text = ""
                    passportDataView.dataSVs.seriaAndNumberSV.errorLabel.isHidden = true
                    passportDataView.dataSVs.seriaAndNumberSV.setPurpleBorderColor()
                } else if i == "dateOfBirth" {
                    passportDataView.dataSVs.dateOfBithSV.errorLabel.text = ""
                    passportDataView.dataSVs.dateOfBithSV.errorLabel.isHidden = true
                    passportDataView.dataSVs.dateOfBithSV.setPurpleBorderColor()
                } else if i == "placeOfBirth" {
                    passportDataView.dataSVs.placeOfBithSV.errorLabel.text = ""
                    passportDataView.dataSVs.placeOfBithSV.errorLabel.isHidden = true
                    passportDataView.dataSVs.placeOfBithSV.setPurpleBorderColor()
                } else if i == "dateOfIssue" {
                    passportDataView.dataSVs.dateOfIssueSV.errorLabel.text = ""
                    passportDataView.dataSVs.dateOfIssueSV.errorLabel.isHidden = true
                    passportDataView.dataSVs.dateOfIssueSV.setPurpleBorderColor()
                } else if i == "organ" {
                    passportDataView.dataSVs.organSV.errorLabel.text = ""
                    passportDataView.dataSVs.organSV.errorLabel.isHidden = true
                    passportDataView.dataSVs.organSV.setPurpleBorderColor()
                }
            }
        }
    }
    
    private func getDataFromTFs() -> [String: String]{
        let data: [String: String] = [
            "seriaAndNumber": passportDataView.dataSVs.seriaAndNumberSV.currentText.text!,
            "dateOfBirth": passportDataView.dataSVs.dateOfBithSV.currentText.text!,
            "placeOfBirth": passportDataView.dataSVs.placeOfBithSV.currentText.text!,
            "dateOfIssue": passportDataView.dataSVs.dateOfIssueSV.currentText.text!,
            "organ": passportDataView.dataSVs.organSV.currentText.text!
        ]
        return data
    }
}

//MARK: ViewModel
extension PassportDataViewController {
    
    private func sendNewDataToDatabase() {
        let data = getDataFromTFs()
        viewModel.changeData(dict: data)
        viewModel.changeDatabase()
    }
}
