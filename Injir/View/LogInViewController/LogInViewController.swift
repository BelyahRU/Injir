//
//  LogInViewController.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let logInView = LogInView()
    
    private let viewModel = LogInViewModel()

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
//Mark: Auth was OK
extension LogInViewController {
    private func logIn() {
        let mainViewController = MainTabBarViewController()
        // Получаем текущую сцену
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            // Заменяем текущий rootViewController на новый для этой сцены
            scene.windows.first?.rootViewController = mainViewController
        }
    }
}


//MARK: Actions
extension LogInViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func logInPressed() {
        let email = logInView.emailTF.text
        let password = logInView.passwordTF.text
        
        viewModel.setUserInfo(email: email, password: password)
        let message = viewModel.isCorrectUserInfo()
        if message == "OK" {
            viewModel.logInUser { result, error in
                if error == nil {
                    if result != nil {
                        self.logIn()
                    } else {
                        print("Ошибка")
                    }
                } else {
                    print(error)
                }
            }
        }
    }
}
