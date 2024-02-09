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
    
    public let dataSVs = RegitrationAndPatentDataSV()
    
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
        
        button.setTitle("Редактировать", for: .normal)
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
        addSubview(registrationAndPatentLabel)
        addSubview(dataSVs)
        addSubview(editButton)
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
        dataSVs.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(166)
            make.leading.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().inset(420)
        }
        
        editButton.snp.makeConstraints { make in
            make.width.equalTo(211)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.top.equalTo(dataSVs.snp.bottom).offset(220)
        }
    }
    
}

extension RegistrationAndPatentView {
    
    public func changeEditButton() {
        UIView.animate(withDuration: 0.3) {
            self.editButton.snp.updateConstraints { make in
                make.width.equalTo(160)
            }
            self.layoutIfNeeded()
        }
        
        editButton.setTitle("Готово", for: .normal)
        dataSVs.editData()
    }

    public func changeOkButton() {
        UIView.animate(withDuration: 0.3) {
            self.editButton.snp.updateConstraints { make in
                make.width.equalTo(211)
            }
            self.layoutIfNeeded()
        }
        
        editButton.setTitle("Редактировать", for: .normal)
        
        dataSVs.stopEditData()
    }


}

extension RegistrationAndPatentView {
    func setupData(data: RegistrationAndPatentData) {
        dataSVs.patentRegistrationView.currentText.text = data.patentRegistration
        dataSVs.permanentRegistrationView.currentText.text = data.permanentRegistration
        dataSVs.temporaryRegistrationView.currentText.text = data.temporaryRegistration
        
    }
}
