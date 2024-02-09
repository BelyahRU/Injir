//
//  PassportDataStackView.swift
//  Injir
//
//  Created by Александр Андреев on 01.02.2024.
//

import UIKit

class PassportDataStackView: UIStackView {

    public let seriaAndNumberSV = CustomStackView(topicText: "Cерия и номер", data: "-")
    public let dateOfBithSV = CustomStackView(topicText: "Дата рождения", data: "-")
    public let placeOfBithSV = CustomStackView(topicText: "Место рождения", data: "-")
    public let dateOfIssueSV = CustomStackView(topicText: "Дата выдачи паспорта", data: "-")
    public let organSV = CustomStackView(topicText: "Орган выдавший паспорт", data: "-")
    
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
        seriaAndNumberSV.canEdit(true)
        dateOfBithSV.canEdit(true)
        placeOfBithSV.canEdit(true)
        dateOfIssueSV.canEdit(true)
        organSV.canEdit(true)
    }
    
    public func stopEditData() {
        seriaAndNumberSV.canEdit(false)
        dateOfBithSV.canEdit(false)
        placeOfBithSV.canEdit(false)
        dateOfIssueSV.canEdit(false)
        organSV.canEdit(false)
    }
    
    
    private func setupSubviews() {
        addArrangedSubview(seriaAndNumberSV)
        addArrangedSubview(dateOfBithSV)
        addArrangedSubview(placeOfBithSV)
        addArrangedSubview(dateOfIssueSV)
        addArrangedSubview(organSV)
    }
    
    private func setupConstraints() {
        [seriaAndNumberSV, dateOfBithSV, placeOfBithSV, dateOfIssueSV, organSV].forEach { sv in
            sv.snp.makeConstraints { make in
                make.width.equalTo(357)
                make.height.equalTo(78)
            }
        }
    }
    
}
