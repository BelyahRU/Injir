//
//  ServicesView.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class TicketsView: UIView {
    
    private let ticketsLabel: UILabel = {
        let label = UILabel()
        label.text = "Билеты"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = Resources.Colors.purpleColor
        return label
    }()
    
    public let transportTypeStackView = TransportTypeStackView()
    
    public let directionView: DirectionView = {
        let view = DirectionView()
        view.makeRadius(radius: 21)
        view.makeBorders(width: 3)
        view.makeBordersColor(color: Resources.Colors.purpleCGColor)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(ticketsLabel)
        addSubview(transportTypeStackView)
        addSubview(directionView)
    }
    
    private func setupConstraints() {
        ticketsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(81)
            make.centerX.equalToSuperview()
        }
        transportTypeStackView.snp.makeConstraints { make in
            make.width.equalTo(238)
            make.height.equalTo(93)
            make.top.equalToSuperview().offset(132)
            make.centerX.equalToSuperview()
        }
        directionView.snp.makeConstraints { make in
            make.width.equalTo(357)
            make.height.equalTo(83)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(246)
        }
    }
    
}
