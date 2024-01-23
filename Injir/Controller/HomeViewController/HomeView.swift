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
        stackView.spacing = 10
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
        setupButtonsStackView()
        
        
        //?
        languageSelected()
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
        //languagesView.addSubview(buttonsStackView)
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
    //MARK: constraints for views if language selected
    public func languageSelected() {
        
        languagesView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(686)
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(136)
            make.height.equalTo(47)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
        }
        
        selectLanguageButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(17)
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: constraints for views if language selecting now
    public func selectingLanguageView() {
        selectLanguageButton.snp.removeConstraints()
        selectLanguageButton.removeFromSuperview()
        languagesView.snp.removeConstraints()
        languagesView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(686)
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(311)
            make.height.equalTo(47)
        }
        languagesView.addSubview(buttonsStackView)
        
        
        buttonsStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(17)
            make.centerY.equalToSuperview()
            make.width.equalTo(192)
            make.height.equalTo(25)
        }
        
        buttonsStackView.backgroundColor = .brown
        
    }
    
    //settings for buttons
    public func setupButtonsStackView() {
        for language in buttonsArray {
            let languageButton = createLanguageButton(language: language)
            
        }
    }
    
    public func createLanguageButton(language: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: language), for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }
    
}
