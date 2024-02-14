//
//  ProfileViewController.swift
//  Injir
//
//  Created by Александр Андреев on 30.01.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    public let viewModel = ProfileViewModel()
    
    public let profileView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupViewModel()
        setupView()
        setupButtons()
        setupImageView()
    }
    
    private func setupViewModel() {
        viewModel.nameOfUserObservable.bind { [weak self] newUsername in
            DispatchQueue.main.async {
                self?.updateNameUI(name: newUsername!)
            }
        }
        viewModel.professionOfUserObservable.bind { [weak self]newProfession in
            DispatchQueue.main.async {
                self?.updateProfessionUI(professon: newProfession!)
            }

        }
    }
    
    private func updateNameUI(name: String) {
        self.profileView.informationAboutUserView.nameLabel.text = name
    }
    
    private func updateProfessionUI(professon: String) {
        self.profileView.informationAboutUserView.nameOfProfessionLabel.text = professon
    }
    
 
    private func setupView() {
        let group = DispatchGroup()
        
        // Получаем имя пользователя
        group.enter()
        viewModel.getUserName { userName in
            defer { group.leave() }
            if let userName = userName {
                DispatchQueue.main.async {
                    self.profileView.informationAboutUserView.nameLabel.text = userName
                }
            } else {
                print("Failed to retrieve user name")
            }
        }
        
        // Получаем профессию пользователя
        group.enter()
        viewModel.getProfession { profession in
            defer { group.leave() }
            if let profession = profession {
                DispatchQueue.main.async {
                    self.profileView.informationAboutUserView.nameOfProfessionLabel.text = profession
                }
            } else {
                print("Failed to retrieve profession")
            }
        }
        group.enter()
        viewModel.getAvatarImage { base64String in
            defer { group.leave() }
            if let base64String = base64String {
                DispatchQueue.main.async {
                    let imageData = Data(base64Encoded: base64String)
                    let image = UIImage(data: imageData!)
                    self.profileView.avatarImageView.image = image
                }
            }
        }
        group.notify(queue: .main) {
            // Когда оба запроса завершены, добавляем subview
            self.view.addSubview(self.profileView)
            self.profileView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }

    
    private func setupButtons() {
        profileView.logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        profileView.informationAboutUserView.editNameButton.addTarget(self, action: #selector(editName), for: .touchUpInside)
        profileView.informationAboutUserView.editProfessionButton.addTarget(self, action: #selector(editProfession), for: .touchUpInside)
        
        //users data buttons
        
        profileView.usersDataView.checkPassportDataButton.addTarget(self, action: #selector(checkPassport), for: .touchUpInside)
        profileView.usersDataView.checkRegistrationAndPatentButton.addTarget(self, action: #selector(checkRegistrationAndPatent), for: .touchUpInside)
        profileView.usersDataView.checkContactDataButton.addTarget(self, action: #selector(checkContact), for: .touchUpInside)
    }
}

//MARK: Actions
extension ProfileViewController {
    @objc func logOut() {
        delegate?.logOutButtonTapped()
    }
    
    @objc func editName() {
        self.showAlert(title: "Имя") { newName in
            self.viewModel.changeUserName(newUserName: newName)
        }
    }
    
    @objc func editProfession() {
        self.showAlert(title: "Профессия") { newProfession in
            self.viewModel.changeProfession(newProfession: newProfession)
        }
    }
    
    @objc func checkPassport() {
        navigationController?.pushViewController(PassportDataViewController(), animated: false)
    }
    
    @objc func checkRegistrationAndPatent() {
        navigationController?.pushViewController(RegistrationAndPatentViewController(), animated: false)
    }
    
    @objc func checkContact() {
        navigationController?.pushViewController(ContactDataViewController(), animated: false)
    }
}
