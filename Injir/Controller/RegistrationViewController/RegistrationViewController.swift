//
//  RegistrationViewController.swift
//  Injir
//
//  Created by Александр Андреев on 22.01.2024.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegistrationViewController: UIViewController {
    
    private let registrationView = RegistrationView()
    
    private let viewModel = RegistrationViewModel()

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
        registrationView.nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
    }
    
}

//MARK: Actions
extension RegistrationViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextPressed() {
        viewModel.setUserInfo(name: registrationView.nameTF.text,
                              email: registrationView.emailTF.text,
                              password: registrationView.passwordTF.text,
                              repeatPassword: registrationView.repeatPasswordTF.text)
        
        var message = viewModel.isCorrectUserInfo()
        if message == "OK" {
            viewModel.registerUser { result, error in
                message = self.viewModel.addUserToDatabase(result: result, error: error)
                if message == "OK" {
                    //MARK: user's dockuments
                    let mainViewController = MainViewController() // Используйте ваш контроллер главного экрана

                    // Получаем текущую сцену
                    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        // Заменяем текущий rootViewController на новый для этой сцены
                        scene.windows.first?.rootViewController = mainViewController
                    }
                } else {
                    self.showAlert(message: message)
                }
                
            }
        } else {
            showAlert(message: message)
        }
    }
}


