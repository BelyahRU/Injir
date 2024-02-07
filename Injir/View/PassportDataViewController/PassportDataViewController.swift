//
//  PassportDataViewController.swift
//  Injir
//
//  Created by Александр Андреев on 01.02.2024.
//

import UIKit
import FirebaseDatabase

class PassportDataViewController: UIViewController {
    
    private let passportDataView = PassportDataView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupView()
        setupButtons()
    }
    
    private func setupView() {
        view.addSubview(passportDataView)
        
        passportDataView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        passportDataView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }

}

extension PassportDataViewController {
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: false)
    }
}
