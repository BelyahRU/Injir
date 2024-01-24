//
//  RegistrationView.swift
//  Injir
//
//  Created by Александр Андреев on 22.01.2024.
//

import UIKit

class RegistrationView: UIView {

    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
        return button
    }()
    
    private let registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = Resources.Colors.purpleColor
        return label
    }()
    
    public var registerTFsStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 24
        sv.alignment = .fill
        sv.axis = .vertical
        return sv
    }()
    
    public let phoneNumberTF: UITextField = {
        let tf = UITextField()
        tf.generateTF(text: "Введите номер телефона")
        return tf
    }()
    
    public let passwordTF: UITextField = {
        let tf = UITextField()
        tf.generateTF(text: "Введите пароль")
        return tf
    }()
    
    public let repeatPasswordTF: UITextField = {
        let tf = UITextField()
        tf.generateTF(text: "Повторите пароль")
        return tf
    }()
    
    public let nextButton: UIButton = {
        let button = UIButton()
        button.generatePurpleButton(text: "Далее")
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
        addSubview(registrationLabel)
        addSubview(registerTFsStackView)
        
        registerTFsStackView.addArrangedSubview(phoneNumberTF)
        registerTFsStackView.addArrangedSubview(passwordTF)
        registerTFsStackView.addArrangedSubview(repeatPasswordTF)
        
        addSubview(nextButton)
        
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(81)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(25)
        }
        registrationLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top)
            make.centerX.equalToSuperview()
        }
        registerTFsStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(190)
            make.centerX.equalToSuperview()
            make.width.equalTo(357)
            make.bottom.equalToSuperview().inset(473)
        }
        [phoneNumberTF, passwordTF, repeatPasswordTF].forEach({
            $0.snp.makeConstraints { make in
                make.width.equalTo(357)
                make.height.equalTo(47)
            }
        })
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(141)
            make.height.equalTo(46)
            make.top.equalToSuperview().offset(698)
        }
    }
}
