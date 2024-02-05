//
//  RegistrationView.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class RegistrationAndPatentView: UIView {
    
    private let registrationAndPatentLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация и патент"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = Resources.Colors.purpleColor
        return label
    }()
    
    public let dataViews = RegitrationAndPatentDataSV()
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
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
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(backButton)
        addSubview(registrationAndPatentLabel)
        addSubview(dataViews)
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(81)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(25)
        }
        registrationAndPatentLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalTo(167)
        }
        dataViews.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(166)
            make.leading.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().inset(420)
        }
    }
    
}
