//
//  LogInViewController.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let logInView = LogInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(logInView)
        logInView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        logInView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        logInView.logInButton.addTarget(self, action: #selector(logInPressed), for: .touchUpInside)
    }
    
}
extension LogInViewController {
    
}


//MARK: Actions
extension LogInViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func logInPressed() {
        let email = logInView.emailTF.text
        let password = logInView.emailTF.text
    }
}
