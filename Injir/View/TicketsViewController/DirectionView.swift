//
//  DirectionView.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class DirectionView: UIView {
    
    public let fromTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Откуда"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textColor = Resources.Colors.purpleColor
        tf.setPlaceholderColor(Resources.Colors.purpleColorAlpha70)
        return tf
    }()
    
    private let separatorLine = UIImageView(image: UIImage(named: Resources.Images.separatorLine))
    
    public let toTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Куда"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textColor = Resources.Colors.purpleColor
        tf.setPlaceholderColor(Resources.Colors.purpleColorAlpha70)
        return tf
    }()
    
    public let swapCitiesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.swapCitiesButton), for: .normal)
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
        setupConstratins()
    }
    
    private func setupSubviews() {
        addSubview(fromTF)
        addSubview(separatorLine)
        addSubview(swapCitiesButton)
        addSubview(toTF)
    }
    
    private func setupConstratins() {
        separatorLine.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(295)
            make.leading.equalToSuperview().offset(14)
            make.height.equalTo(1)
        }
        
        fromTF.snp.makeConstraints { make in
            make.bottom.equalTo(separatorLine.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(14)
            make.width.equalTo(280)
            make.height.equalTo(22)
        }
        
        toTF.snp.makeConstraints { make in
            make.top.equalTo(separatorLine.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(14)
            make.width.equalTo(280)
            make.height.equalTo(22)
        }
        swapCitiesButton.snp.makeConstraints { make in
            make.size.equalTo(32)
            make.leading.equalTo(separatorLine.snp.trailing)
            make.centerY.equalToSuperview()
        }
        
    }
    
}
