//
//  SeriaAndNumberStackView.swift
//  Injir
//
//  Created by Александр Андреев on 01.02.2024.
//

import UIKit

class CustomStackView: UIStackView {
    
    private let topicLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.purpleColorAlpha70
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    public let view: UIView = {
        let view = UIView()
        view.makeBorders(width: 3)
        view.makeRadius(radius: 22.5)
        view.makeBordersColor(color: Resources.Colors.purpleCGColor)
        return view
    }()
    
    public let currentText: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.purpleColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupLabels(topicText: String, data: String) {
        topicLabel.text = topicText
        currentText.text = data
    }
    
    private func configure() {
        settingsForSV()
        setupSubviews()
        setupConstraints()
    }
    
    private func settingsForSV() {
        spacing = 8
        axis = .vertical
        alignment = .fill
    }
    
    private func setupSubviews() {
        addArrangedSubview(topicLabel)
        addArrangedSubview(view)
        
        view.addSubview(currentText)
    }
    
    private func setupConstraints() {
        
        topicLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        
        view.snp.makeConstraints { make in
            make.width.equalTo(357)
            make.height.equalTo(47)
        }
        
        currentText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
    }
    
}
