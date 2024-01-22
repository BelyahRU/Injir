//
//  LogInViewController.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let logInView = LogInView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(logInView)
        logInView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        logInView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
}

extension LogInViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}
