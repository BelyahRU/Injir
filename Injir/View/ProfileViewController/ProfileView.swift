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
    }
    
    private func setupConstraints() {
        logOutButton.snp.makeConstraints { make in
            make.width.equalTo(211)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(213)
        }
    }

}
