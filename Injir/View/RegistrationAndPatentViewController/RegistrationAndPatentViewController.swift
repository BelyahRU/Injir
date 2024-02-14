//
//  RegistationAndPatentViewController.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class RegistrationAndPatentViewController: UIViewController {
    
    private let regitrationAndPatentView = RegistrationAndPatentView()
    private let viewModel = RegistrtionAndPatentViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        setupViewModel()
        setupButtons()
    }
    
    private func setupViewModel() {
        viewModel.getData { data in
            if data == nil {
                let clearData = RegistrationAndPatentData()
                self.setupViewWithData(data: clearData)
            } else {
                self.setupViewWithData(data: data!)
            }
        }
    }
    
    private func setupViewWithData(data: RegistrationAndPatentData) {
        regitrationAndPatentView.setupData(data: data)
        
        view.addSubview(regitrationAndPatentView)
        regitrationAndPatentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        regitrationAndPatentView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        regitrationAndPatentView.editButton.addTarget(self, action: #selector(editPressed(_:)), for: .touchUpInside)
    }

}

//MARK: Actions
extension RegistrationAndPatentViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func editPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Редактировать" {
            regitrationAndPatentView.changeEditButton()
        } else {
            if isValidData() {
                clearValidationFields()
                regitrationAndPatentView.changeOkButton()
                sendNewDataToDatabase()
            }
            
        }
    }
}

//MARK: Validation data
extension RegistrationAndPatentViewController {
    private func clearValidationFields() {
        regitrationAndPatentView.dataSVs.patentRegistrationView.setPurpleBorderColor()
        regitrationAndPatentView.dataSVs.temporaryRegistrationView.setPurpleBorderColor()
        regitrationAndPatentView.dataSVs.permanentRegistrationView.setPurpleBorderColor()
    }
    
    private func isValidData() -> Bool{
        var newData = RegistrationAndPatentData()
        newData.setValues(from: self.getDataFromTFs())
        let errors = viewModel.validate(data: newData)
        
        if errors.isEmpty {
            return true
        } else {
            showValidationErrors(errors: errors)
            return false
        }
    }
    
    private func showValidationErrors(errors: [String: String]) {
        let fieldsArray = ["patentRegistration", "temporaryRegistration", "permanentRegistration"]
        
        for i in errors {
            if i.key == "patentRegistration" {
                regitrationAndPatentView.dataSVs.patentRegistrationView.errorLabel.text = i.value
                regitrationAndPatentView.dataSVs.patentRegistrationView.setRedBorderColor()
                
            } else if i.key == "temporaryRegistration" {
                regitrationAndPatentView.dataSVs.temporaryRegistrationView.errorLabel.text = i.value
                regitrationAndPatentView.dataSVs.temporaryRegistrationView.setRedBorderColor()
            } else if i.key == "permanentRegistration" {
                regitrationAndPatentView.dataSVs.permanentRegistrationView.errorLabel.text = i.value
                regitrationAndPatentView.dataSVs.permanentRegistrationView.setRedBorderColor()
            }
        }
        
        for i in fieldsArray {
            if errors.keys.contains(i) == false {
                if i == "patentRegistration" {
                    regitrationAndPatentView.dataSVs.patentRegistrationView.setPurpleBorderColor()
                    regitrationAndPatentView.dataSVs.patentRegistrationView.errorLabel.text = ""
                } else if i == "temporaryRegistration" {
                    regitrationAndPatentView.dataSVs.temporaryRegistrationView.setPurpleBorderColor()
                    regitrationAndPatentView.dataSVs.temporaryRegistrationView.errorLabel.text = ""
                } else if i == "permanentRegistration" {
                    regitrationAndPatentView.dataSVs.permanentRegistrationView.setPurpleBorderColor()
                    regitrationAndPatentView.dataSVs.permanentRegistrationView.errorLabel.text = ""
                }
            }
        }
    }
}

extension RegistrationAndPatentViewController {
    func sendNewDataToDatabase() {
        let data = getDataFromTFs()
        viewModel.changeData(dict: data)
        viewModel.changeDatabase()
    }
    
    func getDataFromTFs() -> [String: String]{
        let data: [String: String] = [
            "temporaryRegistration": regitrationAndPatentView.dataSVs.temporaryRegistrationView.currentText.text!,
            "permanentRegistration": regitrationAndPatentView.dataSVs.permanentRegistrationView.currentText.text!,
            "patentRegistration": regitrationAndPatentView.dataSVs.patentRegistrationView.currentText.text!
        ]
        return data
    }
}

