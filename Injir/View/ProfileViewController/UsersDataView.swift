//
//  UsersDataView.swift
//  Injir
//
//  Created by Александр Андреев on 01.02.2024.
//

import UIKit

class UsersDataView: UIView {
    
    public let dataStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.axis = .vertical
        return sv
    }()
    
    //passport data
    public let passportDataView = UIView()
    
    private let passportDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Паспортные данные"
        label.textColor = Resources.Colors.purpleColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    public let checkPassportDataButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.checkButton), for: .normal)
        return button
    }()
    
    //registration and patent data
    public let registrationAndPatentDataView = UIView()
    
    private let registrationAndPatentLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация и патент"
        label.textColor = Resources.Colors.purpleColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    public let checkRegistrationAndPatentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.checkButton), for: .normal)
        return button
    }()
    
    
    //contact data
    public let contactDataView = UIView()
    
    private let contactDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Контактные данные"
        label.textColor = Resources.Colors.purpleColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    public let checkContactDataButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.checkButton), for: .normal)
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
        settingsForView()
        setupSubviews()
        setupConstraints()
    }
    
    private func settingsForView() {
        self.makeBorders(width: 3)
        self.makeRadius(radius: 21)
        self.makeBordersColor(color: Resources.Colors.purpleCGColor)
    }
    
    private func setupSubviews() {
        addSubview(dataStackView)
        
        dataStackView.addArrangedSubview(passportDataView)
        dataStackView.addArrangedSubview(registrationAndPatentDataView)
        dataStackView.addArrangedSubview(contactDataView)
        
        passportDataView.addSubview(passportDataLabel)
        passportDataView.addSubview(checkPassportDataButton)
        
        registrationAndPatentDataView.addSubview(registrationAndPatentLabel)
        registrationAndPatentDataView.addSubview(checkRegistrationAndPatentButton)
        
        contactDataView.addSubview(contactDataLabel)
        contactDataView.addSubview(checkContactDataButton)
    }
    
    private func setupConstraints() {
        dataStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(330)
            make.height.equalTo(107)
        }
        [passportDataView, registrationAndPatentDataView, contactDataView].forEach { view in
            view.snp.makeConstraints { make in
                make.height.equalTo(25)
                make.width.equalTo(335)
            }
        }
        
        [passportDataLabel, registrationAndPatentLabel, contactDataLabel].forEach { label in
            label.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.centerY.equalToSuperview()
            }
        }
        
        [checkPassportDataButton, checkRegistrationAndPatentButton, checkContactDataButton].forEach { button in
            button.snp.makeConstraints { make in
                make.width.height.equalTo(25)
                make.trailing.equalToSuperview()
                make.centerY.equalToSuperview()
            }
        }
    }

}
