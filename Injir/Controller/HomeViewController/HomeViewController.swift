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
    
    
    public let selectLanguageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.Flags.russia), for: .normal)
        return button
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "Язык"
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    public let languagesView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 21
        view.layer.borderColor = Resources.Colors.whiteCGColor
        view.layer.borderWidth = 3
        return view
    }()
    
    public var buttonsArray: [String] = [Resources.Buttons.Flags.russia,
        Resources.Buttons.Flags.uk,
        Resources.Buttons.Flags.uzbekistan,
        Resources.Buttons.Flags.tajikistan,
        Resources.Buttons.Flags.turkmenistan,
    ]
    
    public lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.isHidden = true
        stackView.spacing = 6
        return stackView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
       
    }
    
    private func configure() {
        setupView()
        setupButtons()
        
        setupSV()
        setupUI()
    }
    
    private func setupView() {
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupUI() {
        view.addSubview(languagesView)
        languagesView.addSubview(languageLabel)
        languagesView.addSubview(selectLanguageButton)
        languagesView.addSubview(buttonsStackView)
        constraintsIfLanguageSelected()
    }
    
    private func constraintsIfLanguageSelected() {
        buttonsStackView.isHidden = true
        selectLanguageButton.isHidden = false
        languagesView.snp.removeConstraints()
        languageLabel.snp.removeConstraints()
        
        languagesView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(686)
            make.width.equalTo(136)
            make.height.equalTo(47)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
        }
        
        selectLanguageButton.snp.makeConstraints { make in
            make.width.height.equalTo(35)
            make.leading.equalTo(languageLabel.snp.trailing).offset(17)
            make.centerY.equalToSuperview()
        }
    }
    
    private func constraintsIfLanguageSelecting() {
        buttonsStackView.isHidden = false
        selectLanguageButton.isHidden = true
        languagesView.snp.removeConstraints()
        languageLabel.snp.removeConstraints()
        
        
        languagesView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(686)
            make.width.equalTo(311)
            make.height.equalTo(47)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
        }
        
        buttonsStackView.snp.makeConstraints { make in
//            make.width.equalTo(192)
            make.height.equalTo(47)
            make.centerY.equalToSuperview()
            make.leading.equalTo(languageLabel.snp.trailing).offset(17)
            make.width.equalTo(200)
        }
        
    }
    
    private func setupButtons() {
        logInButton = homeView.logInButton
        registrationButton = homeView.registrationButton
        
        
        logInButton.addTarget(self, action: #selector(logInPressed), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(registrationPressed), for: .touchUpInside)
        selectLanguageButton.addTarget(self, action: #selector(showLanguages), for: .touchUpInside)
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
        constraintsIfLanguageSelecting()
    }
    
    @objc func languageButtonTapped(_ sender: UIButton) {
        selectLanguageButton.setImage(sender.currentImage, for: .normal)
        constraintsIfLanguageSelected()
    }
}

extension HomeViewController {
    func createLanguageButton(language: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: language), for: .normal)
        button.snp.makeConstraints { make in
            make.width.height.equalTo(35)
        }
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(languageButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    func setupSV(){
        for language in buttonsArray {
            let button = createLanguageButton(language: language)
            buttonsStackView.addArrangedSubview(button)
        }
    }
}
