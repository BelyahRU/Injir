//
//  HomeView.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import UIKit

class HomeView: UIView {
    
    //MARK: Properties
    private let logoImage = UIImageView(image: UIImage(named: Resources.Images.logoImage))
    
    private let injirLabel: UILabel = {
        let label = UILabel()
        label.text = "injir"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 39)
        return label
    }()
    
    public let logInButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = Resources.Colors.whiteCGColor
        button.backgroundColor = .clear
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 21
        button.setTitle("Войти", for: .normal)
        button.contentHorizontalAlignment = .left
        button.configuration = UIButton.Configuration.plain()
        button.configuration?.contentInsets.leading = 25
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    public let registrationButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = Resources.Colors.whiteCGColor
        button.backgroundColor = .clear
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 21
        button.setTitle("Регистрация", for: .normal)
        button.contentHorizontalAlignment = .left
        button.configuration = UIButton.Configuration.plain()
        button.configuration?.contentInsets.leading = 25
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    public let selectLanguageButton: UIButton = {
        let button = UIButton()
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
    
    public lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.isHidden = true
        stackView.spacing = 6
        return stackView
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    private func configure() {
        settingsForView()
        
        setupSubviews()
        setupConstraints()
    }
    
    
    private func settingsForView() {
        backgroundColor = Resources.Colors.purpleColor
    }
    
    private func setupSubviews() {
        addSubview(logoImage)
        addSubview(injirLabel)
        addSubview(logInButton)
        addSubview(registrationButton)
        
        addSubview(languagesView)
        languagesView.addSubview(languageLabel)
        languagesView.addSubview(selectLanguageButton)
        languagesView.addSubview(buttonsStackView)
        
    }
    
    private func setupConstraints() {
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(154)
            make.height.equalTo(166.15)
        }
        injirLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(30.85)
            make.centerX.equalToSuperview()
        }
        logInButton.snp.makeConstraints { make in
            make.width.equalTo(357)
            make.height.equalTo(47)
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(98.85)
        }
        registrationButton.snp.makeConstraints { make in
            make.width.equalTo(357)
            make.height.equalTo(47)
            make.centerX.equalToSuperview()
            make.top.equalTo(logInButton.snp.bottom).offset(25)
        }
    }
    
    
    public func updateUIForSelectEDLanguage(language: String) {
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
    
    public func updateUIForSelectINGLanguage() {
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
            make.height.equalTo(47)
            make.centerY.equalToSuperview()
            make.leading.equalTo(languageLabel.snp.trailing).offset(17)
            make.width.equalTo(200)
        }
    }
    
}
