//
//  ProfileView.swift
//  Injir
//
//  Created by Александр Андреев on 30.01.2024.
//

import UIKit

class ProfileView: UIView {
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textColor = Resources.Colors.purpleColor
        return label
    }()
    
    public let logOutButton: UIButton = {
        let button = UIButton()
        button.makeBorders(width: 3)
        button.makeBordersColor(color: Resources.Colors.purpleCGColor)
        button.makeRadius(radius: 21)
        button.setTitle("Выйти из аккаунта", for: .normal)
        button.setTitleColor(UIColor(red: 0.683, green: 0.193, blue: 0.193, alpha: 1), for: .normal)
        return button
    }()

    //MARK: INFO about user
    public let informationAboutUserView = InformationAboutUserView()
    
    public let avatarImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "avatar")
        im.layer.cornerRadius = 129/2
        im.clipsToBounds = true
        return im
    }()
    //MARK: User's data
    
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
        addSubview(profileLabel)
        addSubview(logOutButton)
        addSubview(informationAboutUserView)
        addSubview(avatarImageView)
    }
    
    private func setupConstraints() {
        profileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(82)
            make.centerX.equalToSuperview()
        }
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
        
        avatarImageView.snp.makeConstraints { make in
            make.size.equalTo(129)
            make.centerY.equalTo(informationAboutUserView.snp.top)
            make.centerX.equalToSuperview()
        }
    }
    
    

}
