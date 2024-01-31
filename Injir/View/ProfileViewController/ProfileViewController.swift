//
//  ProfileViewController.swift
//  Injir
//
//  Created by Александр Андреев on 30.01.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    private let profileView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        profileView.logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
    }
}

//MARK: Actions
extension ProfileViewController {
    @objc func logOut() {
        delegate?.logOutButtonTapped()
    }
}
