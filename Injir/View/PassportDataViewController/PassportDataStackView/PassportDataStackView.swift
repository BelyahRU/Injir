//
//  PassportDataStackView.swift
//  Injir
//
//  Created by Александр Андреев on 01.02.2024.
//

import UIKit

class PassportDataStackView: UIStackView {

    public let seriaAndNumberSV = CustomStackView()
    public let dateOfBithSV = CustomStackView()
    public let placeOfBithSV = CustomStackView()
    public let dateOfIssueSV = CustomStackView()
    public let organSV = CustomStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        settingsForView()
        setupSVs()
        setupSubviews()
        setupConstraints()
    }
    
    private func settingsForView() {
        spacing = 16
        axis = .vertical
    }
    
    private func setupSVs() {
        seriaAndNumberSV.setupLabels(topicText: "Cерия и номер", data: "Cерия и номер")
        dateOfBithSV.setupLabels(topicText: "Дата рождения", data: "Дата рождения")
        placeOfBithSV.setupLabels(topicText: "Место рождения", data: "Место рождения")
        dateOfIssueSV.setupLabels(topicText: "Дата выдачи паспорта", data: "Дата выдачи паспорта")
        organSV.setupLabels(topicText: "Орган выдавший паспорт", data: "Орган выдавший паспорт")
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
