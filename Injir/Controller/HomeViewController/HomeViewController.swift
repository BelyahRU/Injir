//
//  HomeViewController.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    private var logInButton = UIButton()
    private var registrationButton = UIButton()
    private var languageButton = UIButton()
    
    
    public var buttonsArray: [String] = [Resources.Buttons.Flags.russia,
        Resources.Buttons.Flags.uk,
        Resources.Buttons.Flags.uzbekistan,
        Resources.Buttons.Flags.tajikistan,
        Resources.Buttons.Flags.turkmenistan,
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
       
    }
    
    private func configure() {
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    private func setupButtons() {
        logInButton = homeView.logInButton
        registrationButton = homeView.registrationButton
        languageButton = homeView.selectLanguageButton
        
        logInButton.addTarget(self, action: #selector(logInPressed), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(registrationPressed), for: .touchUpInside)
        languageButton.addTarget(self, action: #selector(showLanguages), for: .touchUpInside)
    }

}

extension HomeViewController {
    @objc func logInPressed() {
        let logInVC = LogInViewController()
        navigationController?.pushViewController(logInVC, animated: true)
        
    }
    
    @objc func registrationPressed() {
        let registerVC = RegistrationViewController()
        navigationController?.pushViewController(registerVC, animated: true)
        
    }
    
    @objc func showLanguages() {
        self.homeView.selectingLanguageView()
        //self.homeView
//        // Плавное исчезновение кнопки "Выбрать язык"
//        UIView.animate(withDuration: 0.5) {
//            self.showLanguagesButton.alpha = 0.0
//        }
//
//        // Плавное появление стека с языками
//        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseIn) {
//            self.stackView.isHidden = false
//            self.stackView.alpha = 1.0
//        }
    }
    
    @objc func languageButtonTapped(_ sender: UIButton) {
    }
}

extension HomeViewController {
    func createLanguageButton(language: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: language), for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(languageButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    func setupSV(){
        for language in buttonsArray {
            let button = createLanguageButton(language: language)
            homeView.buttonsStackView.addArrangedSubview(button)
        }
    }
}
