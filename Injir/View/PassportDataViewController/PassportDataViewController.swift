//
//  PassportDataViewController.swift
//  Injir
//
//  Created by Александр Андреев on 01.02.2024.
//

import UIKit

class PassportDataViewController: UIViewController {
    
    private let passportDataView = PassportDataView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        setupView()
    }
    
    private func setupView() {
        view.addSubview(passportDataView)
        passportDataView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
