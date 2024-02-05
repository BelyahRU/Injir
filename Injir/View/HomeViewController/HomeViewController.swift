//
//  HomeViewController2.swift
//  Injir
//
//  Created by Александр Андреев on 23.01.2024.
//

import Foundation
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()

    private let languageSelectionViewModel = LanguageSelectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupViewModel()
        setupView()
        setupButtons()
        setupSV()
    }
    
    private func setupViewModel() {
        languageSelectionViewModel.selectedLanguageObservable.bind { [weak self] selectedLanguage in
            self?.updateLanguageUI(language: selectedLanguage)
        }
    }
    
    private func updateLanguageUI(language: String?) {
        if language == nil {
            homeView.showChangingLanguageMenu()
        } else {
            homeView.updateUIForSelectedLanguage(language!)
        }
    }
    
    private func setupView() {
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    private func setupButtons() {
        
        homeView.logInButton.addTarget(self, action: #selector(logInPressed), for: .touchUpInside)
        homeView.registrationButton.addTarget(self, action: #selector(registrationPressed), for: .touchUpInside)
        homeView.selectLanguageButton.addTarget(self, action: #selector(showLanguages), for: .touchUpInside)
    }

}
//MARK: settings for language stackView
extension HomeViewController {
    func setupSV(){
        for language in languageSelectionViewModel.availableLanguages {
            let button = createLanguageButton(language: language)
            homeView.buttonsStackView.addArrangedSubview(button)
        }
    }
    
    func createLanguageButton(language: String) -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(named: language), for: .normal)
        button.snp.makeConstraints { make in
            make.width.height.equalTo(35)
        }
        button.setTitle(language, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(.clear, for: .normal)
        button.addTarget(self, action: #selector(languageButtonTapped(_:)), for: .touchUpInside)
        return button
    }
}

//MARK: Actions
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
        languageSelectionViewModel.deselectLanguage()
    }
    
    @objc func languageButtonTapped(_ sender: UIButton) {
        languageSelectionViewModel.selectLanguage(sender.currentTitle!)
    }
}

