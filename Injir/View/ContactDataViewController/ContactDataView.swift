//
//  ContactDataView.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class ContactDataView: UIView {

    private let contactDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Контактные данные"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = Resources.Colors.purpleColor
        return label
    }()
        
    public let dataSVs = ContactDataStackView()

    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
        return button
    }()
    
    public let editButton: UIButton = {
        let button = UIButton()
        button.makeRadius(radius: 21)
        button.makeBorders(width: 3)
        button.makeBordersColor(color: Resources.Colors.purpleCGColor)
        
        button.setTitle("Изменить номер телефона", for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 17)
        button.setTitleColor(Resources.Colors.purpleColor, for: .normal)
        button.titleLabel!.textAlignment = .center
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
        addSubview(contactDataLabel)
        addSubview(dataSVs)
        addSubview(editButton)
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(81)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(25)
        }
        contactDataLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top)
            make.centerX.equalToSuperview()
        }
        
        dataSVs.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(166)
            make.leading.equalToSuperview().offset(18)
            make.height.equalTo(172)
        }
        
        editButton.snp.makeConstraints { make in
            make.width.equalTo(255)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.top.equalTo(dataSVs.snp.bottom).offset(42)
        }
    }
    
}

extension ContactDataView {
    public func changeEditButton() {
        
        self.editButton.snp.updateConstraints { make in
            make.width.equalTo(160)
        }
        self.layoutIfNeeded()
        
        editButton.setTitle("Готово", for: .normal)
        dataSVs.editData()
    }

    public func changeOkButton() {
        self.editButton.snp.updateConstraints { make in
            make.width.equalTo(255)
        }
        self.layoutIfNeeded()
        
        editButton.setTitle("Изменить номер телефона", for: .normal)
        dataSVs.stopEditData()
    }
}

extension ContactDataView {
    public func setupPhone(phone: String) {
        dataSVs.phoneNumberSV.currentText.text = phone
    }
    
    public func setupEmail(email: String) {
        dataSVs.emailNumberSV.currentText.text = email
    }
}

