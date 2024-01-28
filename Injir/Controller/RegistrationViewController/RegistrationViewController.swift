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
//        fullRegistration()
        let dataError = sendDataToViewModel()
        guard let dataError = dataError else {
            viewModel.registerUser { result, error in
                let message = self.viewModel.addUserToDatabase(result: result, error: error)
                guard let message = message else {
                    //MARK: user's dockuments
                    self.viewModel.logInUser { result, error in
                        if error == nil {
                            if result != nil {
                                self.logIn()
                            } else {
                                print("Ошибка, нет результата")
                            }
                        } else {
                            print("Ошибка")
                            print(error)
                        }
                    }
                    return
                }
                self.showAlert(message: message)
                
                
//                if message == nil {
//                    //MARK: user's dockuments
//                    self.viewModel.logInUser { result, error in
//                        if error == nil {
//                            if result != nil {
//                                self.logIn()
//                            } else {
//                                print("Ошибка, нет результата")
//                            }
//                        } else {
//                            print("Ошибка")
//                            print(error)
//                        }
//                    }
//                } else {
//                    self.showAlert(message: message!)
//                }

            }
            return
        }
        showAlert(message: dataError)
        
    }
}

extension RegistrationViewController {
    private func fullRegistration() {
        let dataError = sendDataToViewModel()
        guard let dataError = dataError else {
            guard let regError = self.registrationUser() else {
                print("Успешная регистрация")
                return
            }
            showAlert(message: regError)
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
    
    private func registrationUser() -> String? {
        var message: String? = nil
        viewModel.registerUser { result, error in
            print("Ошибка регистрации")
            print(error)
            print(result)
            guard let error = error else {
                message = self.viewModel.addUserToDatabase(result: result, error: error)
                return
            }
            message = "Пароль маленький"
            
        }
        return message
    }
    
    private func addUserToDatabase(result: AuthDataResult?, error: Error?) -> String?{
        print(error)
        print(result)
        return self.viewModel.addUserToDatabase(result: result, error: error)
    }
    
}



//MARK: Verification was OK
extension RegistrationViewController {
    private func logIn() {
        let mainViewController = MainViewController()
        // Получаем текущую сцену
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            // Заменяем текущий rootViewController на новый для этой сцены
            scene.windows.first?.rootViewController = mainViewController
        }
    }
}


