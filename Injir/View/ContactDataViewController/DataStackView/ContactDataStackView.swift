//
//  ContactDataStackView.swift
//  Injir
//
//  Created by Александр Андреев on 08.02.2024.
//

import UIKit

class ContactDataStackView: UIStackView {
    
    public let emailNumberSV = CustomStackView(topicText: "Электронная почта", placeholderText: "")

    public let phoneNumberSV = CustomStackView(topicText: "Номер телефона", placeholderText: "+79999999999")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        settingsForView()
        setupSubviews()
        setupConstraints()
    }
    
    private func settingsForView() {
        spacing = 16
        axis = .vertical
    }
    
    public func editData() {
        phoneNumberSV.canEdit(true)
    }
    
    public func stopEditData() {
        phoneNumberSV.canEdit(false)
    }
    
    
    private func setupSubviews() {
        addArrangedSubview(phoneNumberSV)
        addArrangedSubview(emailNumberSV)
    }
    
    private func setupConstraints() {
        
        [phoneNumberSV, emailNumberSV].forEach { sv in
            sv.snp.makeConstraints { make in
                make.width.equalTo(357)
                make.height.equalTo(78)
            }
        }
    }
    

}
