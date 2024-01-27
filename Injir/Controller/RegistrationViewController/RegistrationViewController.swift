//
//  RegistrationViewController.swift
//  Injir
//
//  Created by Александр Андреев on 22.01.2024.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private let registrationView = RegistrationView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(registrationView)
        registrationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        registrationView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
}

//MARK: Actions
extension RegistrationViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}
