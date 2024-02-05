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
    
    public let dataSV = PassportDataStackView()
    
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
        addSubview(dataSV)
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
        
        dataSV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(166)
            make.centerX.equalToSuperview()
            make.width.equalTo(357)
            make.height.equalTo(450)
        }
    }
    
}
