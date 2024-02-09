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
    
    public let currentText: UITextField = {
        let tf = UITextField()
        tf.textColor = Resources.Colors.purpleColor
        tf.isUserInteractionEnabled = false
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.autocapitalizationType = .none
        return tf
    }()
    
    public let errorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = Resources.Colors.redColor
        return label
    }()
    
    init(topicText: String, data: String) {
        super.init(frame: .zero)
        topicLabel.text = topicText
        currentText.text = data
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        settingsForSV()
        setupSubviews()
        setupConstraints()
    }
    
    public func canEdit(_ answ: Bool) {
        currentText.isUserInteractionEnabled = answ
    }
    
    public func setRedBorderColor() {
        view.makeBordersColor(color: Resources.Colors.redCGColor)
        errorLabel.isHidden = false
    }
    
    public func setPurpleBorderColor() {
        view.makeBordersColor(color: Resources.Colors.purpleCGColor)
        errorLabel.isHidden = true
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
        view.addSubview(errorLabel)
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
            make.trailing.equalToSuperview().inset(15)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.height.equalTo(22)
            make.top.equalTo(view.snp.bottom)
        }
    }
    
}
