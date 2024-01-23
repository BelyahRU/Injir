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
    
}
