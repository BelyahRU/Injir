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
    
    private var nameTF = UITextField()
    private var emailTF = UITextField()
    private var passwordTF = UITextField()
    private var repeatPasswordTF = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        setupView()
        setupTFs()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(registrationView)
        registrationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTFs() {
        nameTF = registrationView.nameTF
        emailTF = registrationView.emailTF
        passwordTF = registrationView.passwordTF
        repeatPasswordTF = registrationView.repeatPasswordTF
        
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
        if isCorrectTFs() {
            let name = nameTF.text!
            let email = emailTF.text!
            let password = passwordTF.text!
            Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
                print(error, result)
                if error == nil {
                    if let result = result {
                        print(result.user.uid)
                        let ref = Database.database().reference().child("users")
                        ref.child(result.user.uid).updateChildValues(["name": name, "email": email])
                    }
                }
            })
        } 
    }
}
//ошибки
extension RegistrationViewController {
    
    private func isCorrectTFs() -> Bool {
        if passwordTF.text != repeatPasswordTF.text {
            showAlert(message: "Пароли не совпадают, повторите ввод")
            return false
        } else if nameTF.text == "" || passwordTF.text == "" ||  repeatPasswordTF.text == "" || emailTF.text == ""{
            showAlert(message: "Не все поля заполнены")
            return false
        } else if !(emailTF.text?.contains("@"))! {
            showAlert(message: "email заполнен неверно, повторите ввод")
            return false
        }
        return true
    }
}


