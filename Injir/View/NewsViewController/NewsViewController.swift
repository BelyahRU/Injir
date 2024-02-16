//
//  NewsViewController.swift
//  Injir
//
//  Created by Александр Андреев on 30.01.2024.
//

import UIKit

class NewsViewController: UIViewController {
    
    public let newsTableView = UITableView()
    public let viewModel = NewsViewModel()
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.text = "Новости"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textColor = Resources.Colors.purpleColor
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupSubviews()
        setupConstraints()
        setupViewModel()
        settingsForTableView()
    }
    
    private func setupViewModel() {
        settingsForTableView()
        viewModel.getData()
        registerCells()
    }
    
    private func setupSubviews() {
        view.addSubview(newsLabel)
        view.addSubview(newsTableView)
    }
    
    private func setupConstraints() {
        newsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(82)
        }
        
        newsTableView.snp.makeConstraints { make in
            make.top.equalTo(newsLabel.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(90)
        }
    }


}


