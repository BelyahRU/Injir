//
//  ContactDataViewController.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class ContactDataViewController: UIViewController {
    
    private let contactDataView = ContactDataView()
    public let temporaryRegistrationView = CustomStackView(topicText: "Номер телефона", data: "-")

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    private func configure() {
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(contactDataView)
        contactDataView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        contactDataView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }

}

extension ContactDataViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
}
