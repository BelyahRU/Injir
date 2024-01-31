//
//  ProfileView.swift
//  Injir
//
//  Created by Александр Андреев on 30.01.2024.
//

import UIKit

class ProfileView: UIView {
    
    public let logOutButton: UIButton = {
        let button = UIButton()
        button.makeBorders(width: 3)
        button.makeBordersColor(color: Resources.Colors.purpleCGColor)
        button.makeRadius(radius: 21)
        button.setTitle("Выйти из аккаунта", for: .normal)
        button.setTitleColor(UIColor(red: 0.683, green: 0.193, blue: 0.193, alpha: 1), for: .normal)
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
    
    
    public let informationAboutUserView: UIView = {
        let view = UIView()
        view.makeBorders(width: 3)
        view.makeBordersColor(color: Resources.Colors.purpleCGColor)
        view.makeRadius(radius: 22.5)
        return view
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
        addSubview(logOutButton)
        addSubview(informationAboutUserView)
        
        informationAboutUserView.addSubview(professionLabel)
        informationAboutUserView.addSubview(professionView)
    }
    
    private func setupConstraints() {
        logOutButton.snp.makeConstraints { make in
            make.width.equalTo(211)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(213)
        }
        
        informationAboutUserView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(224)
            make.centerX.equalToSuperview()
            make.width.equalTo(357)
            make.height.equalTo(210)
        }
        
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
        
    }
    
    

}
