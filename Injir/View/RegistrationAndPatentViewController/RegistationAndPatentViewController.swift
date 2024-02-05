//
//  RegistationAndPatentViewController.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class RegistationAndPatentViewController: UIViewController {
    
    private let regitrationAndPatentView = RegistrationAndPatentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(regitrationAndPatentView)
        regitrationAndPatentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        regitrationAndPatentView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }

}

extension RegistationAndPatentViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
}

