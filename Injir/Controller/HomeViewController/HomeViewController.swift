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
    private var registerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
       
    }
    
    private func configure() {
        setupView()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    private func setupButtons() {
        logInButton = homeView.logInButton
    }

}
