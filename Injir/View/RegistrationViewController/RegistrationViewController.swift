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
        fullRegistration()
        // need to add VCs for user's dockuments
        logIn()
    }
}

extension RegistrationViewController {
    private func fullRegistration() {
        let dataError = sendDataToViewModel()
        guard let dataError = dataError else {
            viewModel.registerUser { result, error in
                let message = self.viewModel.addUserToDatabase(result: result, error: error)
                guard let message = message else {
                    return
                }
                self.showAlert(message: message)
            }
            return
        }
        showAlert(message: dataError)
        
    }
    
    private func sendDataToViewModel() -> String? {
        viewModel.setUserInfo(name: registrationView.nameTF.text,
                              email: registrationView.emailTF.text,
                              password: registrationView.passwordTF.text,
                              repeatPassword: registrationView.repeatPasswordTF.text)
        return viewModel.getDataError()
    }
}



//MARK: LogIn
extension RegistrationViewController {
    private func logIn() {
        //здесь ошибка где то
        self.viewModel.logInUser { result, error in
            guard let error = error else {
                guard let result = result else {
                    print("Ошибка, нет результата")
                    return
                }
                self.showMainVC()
                return
            }
            print("Ошибка")
            print(error.localizedDescription)
        }
    }
    
    private func showMainVC() {
        let mainViewController = MainViewController()
        // Получаем текущую сцену
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            // Заменяем текущий rootViewController на новый для этой сцены
            scene.windows.first?.rootViewController = mainViewController
        }
    }
}


