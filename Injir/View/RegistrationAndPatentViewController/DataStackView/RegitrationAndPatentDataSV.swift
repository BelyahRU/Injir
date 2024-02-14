//
//  RegitrationAndPatentDataSV.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class RegitrationAndPatentDataSV: UIStackView {

   public let temporaryRegistrationView = CustomStackView(topicText: "Временная регистрация", placeholderText: "г.Cанкт-Петербург, Московский пр. д64, кв1")
   public let permanentRegistrationView = CustomStackView(topicText: "Постоянная регистрация", placeholderText: "г.Cанкт-Петербург, Московский пр. д64, кв1")
   public let patentRegistrationView = CustomStackView(topicText: "Патент на работу", placeholderText: "0000-000000")
    
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
    
    public func editData() {
        temporaryRegistrationView.canEdit(true)
        permanentRegistrationView.canEdit(true)
        patentRegistrationView.canEdit(true)
    }
    
    public func stopEditData() {
        temporaryRegistrationView.canEdit(false)
        permanentRegistrationView.canEdit(false)
        patentRegistrationView.canEdit(false)
    }
    
    private func settingsForView() {
        spacing = 16
        axis = .vertical
    }
    
    
    private func setupSubviews() {
        addArrangedSubview(temporaryRegistrationView)
        addArrangedSubview(permanentRegistrationView)
        addArrangedSubview(patentRegistrationView)
    }
    
    private func setupConstraints() {
        [temporaryRegistrationView, permanentRegistrationView, patentRegistrationView].forEach { sv in
            sv.snp.makeConstraints { make in
                make.width.equalTo(357)
                make.height.equalTo(78)
            }
        }
    }

}
