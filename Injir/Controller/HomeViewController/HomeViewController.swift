//
//  HomeViewController.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    private var logInButton = UIButton()
    private var registrationButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
       
    }
    
    private func configure() {
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    private func setupButtons() {
        logInButton = homeView.logInButton
        registrationButton = homeView.registrationButton
        
        logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
    }

}

extension HomeViewController {
    @objc func logIn() {
        let logInVC = LogInViewController()
        navigationController?.pushViewController(logInVC, animated: true)
        
    }
}
