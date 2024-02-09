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
//        viewModel.ge
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

extension PassportDataViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func editPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Редактировать" {
            passportDataView.changeEditButton()
        } else {
            passportDataView.changeOkButton()
            sendNewDataToDatabase()
        }
    }
}

extension PassportDataViewController {
    
    func sendNewDataToDatabase() {
        let data = getDataFromTFs()
        viewModel.changeData(dict: data)
        viewModel.changeDatabase()
    }
    
    func getDataFromTFs() -> [String: String]{
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
