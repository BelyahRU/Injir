//
//  RegistationAndPatentViewController.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class RegistationAndPatentViewController: UIViewController {
    
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

extension RegistationAndPatentViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func editPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Редактировать" {
            regitrationAndPatentView.changeEditButton()
        } else {
            regitrationAndPatentView.changeOkButton()
            sendNewDataToDatabase()
        }
    }
}

extension RegistationAndPatentViewController {
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

