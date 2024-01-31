//
//  ProfileViewController.swift
//  Injir
//
//  Created by Александр Андреев on 30.01.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    public let profileView = ProfileView()

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
        profileView.informationAboutUserView.editNameButton.addTarget(self, action: #selector(editName), for: .touchUpInside)
        profileView.informationAboutUserView.editProfessionButton.addTarget(self, action: #selector(editProfession), for: .touchUpInside)
    }
}

//MARK: Actions
extension ProfileViewController {
    @objc func logOut() {
        delegate?.logOutButtonTapped()
    }
    
    @objc func editName() {
        self.showAlert(title: "Имя") { newName in
            self.profileView.informationAboutUserView.nameLabel.text = newName
        }
    }
    
    @objc func editProfession() {
        self.showAlert(title: "Профессия") { newProfession in
            self.profileView.informationAboutUserView.nameOfProfessionLabel.text = newProfession
        }

    }
}
