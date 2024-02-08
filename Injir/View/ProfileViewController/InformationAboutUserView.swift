//
//  InformationABoutUserView.swift
//  Injir
//
//  Created by Александр Андреев on 31.01.2024.
//

import UIKit

class InformationAboutUserView: UIView {
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.purpleColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    public let editNameButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.editButton), for: .normal)
        return button
    }()
    
    private let professionLabel: UILabel = {
        let label = UILabel()
        label.text = "Профессия"
        label.textColor = Resources.Colors.purpleColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    public let professionView: UIView = {
        let view = UIView()
        view.makeBorders(width: 3)
        view.makeRadius(radius: 22.5)
        view.makeBordersColor(color: Resources.Colors.purpleCGColor)
        return view
    }()
    
    public let nameOfProfessionLabel: UILabel = {
        let label = UILabel()
        label.text = "Плотник"
        label.textColor = Resources.Colors.purpleColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    public let editProfessionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.editButton), for: .normal)
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
        settingsForView()
        setupSubviews()
        setupContstraints()
    }
    
    private func settingsForView() {
        makeBorders(width: 3)
        makeBordersColor(color: Resources.Colors.purpleCGColor)
        makeRadius(radius: 22.5)
    }
    
    private func setupSubviews() {
        addSubview(nameLabel)
        addSubview(editNameButton)
        addSubview(professionLabel)
        addSubview(professionView)
        
        professionView.addSubview(nameOfProfessionLabel)
        professionView.addSubview(editProfessionButton)
        
    }
    
    private func setupContstraints() {
        professionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(152)
            make.width.equalTo(335)
            make.height.equalTo(47)
        }
        
        professionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(119)
            make.leading.equalToSuperview().offset(11)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(75)
        }
        
        editNameButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.size.equalTo(28)
            make.leading.equalTo(nameLabel.snp.trailing)
        }
        
        nameOfProfessionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(44)
        }
        
        editProfessionButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(28)
            make.leading.equalTo(nameOfProfessionLabel.snp.trailing)
        }
    }
    
}
