//
//  LogInView.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import UIKit

class LogInView: UIView, UITextFieldDelegate {
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
        return button
    }()
    
    private let logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = Resources.Colors.purpleColor
        return label
    }()
    
    public let phoneNumberTF: UITextField = {
        let tf = UITextField()
        tf.generateTF(text: "Введите номер телефона")
        tf.textContentType = .telephoneNumber
        tf.keyboardType = .phonePad
        return tf
    }()
    
    public let passwordTF: UITextField = {
        let tf = UITextField()
        tf.generateTF(text: "Введите пароль")
        tf.textContentType = .password
        tf.isSecureTextEntry = true
        tf.returnKeyType = .done
        return tf
    }()
    
    public let logInButton: UIButton = {
        let button = UIButton()
        button.generatePurpleButton(text: "Войти")
        return button
    }()
    
    public let recoverPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        // Создаем атрибутированный текст с подчеркиванием
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: UIFont.systemFont(ofSize: 15)
        ]
        let attributedText = NSAttributedString(string: "Восстановить пароль", attributes: attributes)
        // Устанавливаем атрибутированный текст на кнопку
        button.setAttributedTitle(attributedText, for: .normal)
        button.setTitleColor(Resources.Colors.purpleColor, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        settingForView()
        setupSubviews()
        setupConstraints()
    }
    
    private func settingForView() {
        backgroundColor = .white
    }

    private func setupSubviews() {
        addSubview(backButton)
        addSubview(logInLabel)
        addSubview(phoneNumberTF)
        addSubview(passwordTF)
        addSubview(logInButton)
        addSubview(recoverPasswordButton)
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(81)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(25)
        }
        logInLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top)
            make.centerX.equalToSuperview()
        }
        phoneNumberTF.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(190)
            make.centerX.equalToSuperview()
            make.width.equalTo(357)
            make.height.equalTo(47)
        }
        passwordTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(phoneNumberTF.snp.size)
            make.top.equalTo(phoneNumberTF.snp.bottom).offset(24)
        }
        logInButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(698)
            make.centerX.equalToSuperview()
            make.width.equalTo(141)
            make.height.equalTo(46)
        }
        recoverPasswordButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(772)
            make.width.equalTo(170)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
        }
    }
}
