//
//  ContactDataViewController.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class ContactDataViewController: UIViewController {
    
    private let contactDataView = ContactDataView()
    private let viewModel = ContactDataViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    private func configure() {
        setupViewModel()
        setupButtons()
        setupView()
    }
    
    private func setupViewModel() {
        viewModel.getEmailData { newEmail in
            if newEmail != nil {
                self.contactDataView.setupEmail(email: newEmail!)
            }
        }
        
        viewModel.getPhoneNumberData { newPhone in
            if newPhone != nil {
                self.contactDataView.setupPhone(phone: newPhone!)
            }
        }
    }
    
    private func setupView() {
        view.addSubview(contactDataView)
        
        contactDataView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        contactDataView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        contactDataView.editButton.addTarget(self, action: #selector(editPressed(_:)), for: .touchUpInside)
    }

}

extension ContactDataViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func editPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Изменить номер телефона" {
            contactDataView.changeEditButton()
        } else {
            contactDataView.changeOkButton()
            sendNewDataToDatabase()
        }
    }
}

extension ContactDataViewController {
    func sendNewDataToDatabase() {
        let newPhone = contactDataView.dataSVs.phoneNumberSV.currentText.text!
        viewModel.changePhoneNumber(newPhone: newPhone)
        viewModel.changeDatabase()
    }
    
}
