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
        button.backgroundColor = .clear
        button.titleLabel?.tintColor = .white
        button.makeBorders(width: 3)
        button.makeRadius(radius: 21)
        button.makeBordersColor(color: Resources.Colors.whiteCGColor)
        button.setTitle("Войти", for: .normal)
        button.contentHorizontalAlignment = .left
        button.configuration = UIButton.Configuration.plain()
        button.configuration?.contentInsets.leading = 25
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    public let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = UIButton.Configuration.plain()
        button.backgroundColor = .clear
        button.makeBorders(width: 3)
        button.makeRadius(radius: 21)
        button.makeBordersColor(color: Resources.Colors.whiteCGColor)
        button.setTitle("Регистрация", for: .normal)
        button.contentHorizontalAlignment = .left
        button.configuration = UIButton.Configuration.plain()
        button.configuration?.contentInsets.leading = 25
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    public let selectLanguageButton = UIButton()
    
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
        setupLanguageView()
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
        
    }
    
    private func setupLanguageView() {
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
    
    
    public func updateUIForSelectedLanguage(_ selectedLanguage: String) {
        selectLanguageButton.setImage(UIImage(named: selectedLanguage), for: .normal)

        UIView.animate(withDuration: 0.2) {
            self.buttonsStackView.isHidden = true
            self.selectLanguageButton.isHidden = false
            self.languagesView.snp.removeConstraints()
            self.languageLabel.snp.removeConstraints()

            self.languagesView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(18)
                make.top.equalToSuperview().offset(686)
                make.width.equalTo(136)
                make.height.equalTo(47)
            }

            self.languageLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(25)
            }

            self.selectLanguageButton.snp.makeConstraints { make in
                make.width.height.equalTo(35)
                make.leading.equalTo(self.languageLabel.snp.trailing).offset(17)
                make.centerY.equalToSuperview()
            }

            self.layoutIfNeeded()
        }
    }

    public func showChangingLanguageMenu() {
        UIView.animate(withDuration: 0.2) {
            self.buttonsStackView.isHidden = false
            self.selectLanguageButton.isHidden = true
            self.languagesView.snp.remakeConstraints { make in
                make.leading.equalToSuperview().offset(18)
                make.top.equalToSuperview().offset(686)
                make.width.equalTo(311)
                make.height.equalTo(47)
            }

            self.languageLabel.snp.remakeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(25)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.buttonsStackView.snp.remakeConstraints { make in
                    make.height.equalTo(47)
                    make.centerY.equalToSuperview()
                    make.leading.equalTo(self.languageLabel.snp.trailing).offset(17)
                    make.width.equalTo(200)
                }
            }
            self.layoutIfNeeded()
        }
    }


    
}