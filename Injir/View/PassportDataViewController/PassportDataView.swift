//
//  PassportDataView.swift
//  Injir
//
//  Created by Александр Андреев on 01.02.2024.
//

import UIKit

class PassportDataView: UIView {
    
    private let passportDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Паспортные данные"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textColor = Resources.Colors.purpleColor
        return label
    }()
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
        return button
    }()
    
    public let dataSVs = PassportDataStackView()
    
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
        addSubview(passportDataLabel)
        addSubview(dataSVs)
        addSubview(editButton)
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(81)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(25)
        }
        passportDataLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top)
            make.centerX.equalToSuperview()
        }
        
        dataSVs.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(166)
            make.centerX.equalToSuperview()
            make.width.equalTo(357)
            make.height.equalTo(450)
        }
        
        editButton.snp.makeConstraints { make in
            make.width.equalTo(211)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.top.equalTo(dataSVs.snp.bottom).offset(42)
        }
    }
    
}

extension PassportDataView {
    public func setupData(data: PassportData) {
        dataSVs.seriaAndNumberSV.currentText.text = data.seriaAndNumber
        dataSVs.dateOfBithSV.currentText.text = data.dateOfBirth
        dataSVs.dateOfIssueSV.currentText.text = data.dateOfIssue
        dataSVs.organSV.currentText.text = data.organ
        dataSVs.placeOfBithSV.currentText.text = data.placeOfBirth
    }
}

extension PassportDataView {
    
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
