//
//  TransportTypeView.swift
//  Injir
//
//  Created by Александр Андреев on 05.02.2024.
//

import UIKit

class TransportTypeStackView: UIStackView {
    
    //PLANE
    public let planeView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .center
        return view
    }()
    public let planeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.BiletsIcons.Unselected.planeIcon), for: .normal)
        return button
    }()
    
    public let planeLabel: UILabel = {
        let label = UILabel()
        label.text = "Авиа"
        label.textColor = Resources.Colors.purpleColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    
    //TRAIN
    public let trainView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .center
        return view
    }()
    public let trainButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.BiletsIcons.Unselected.trainIcon), for: .normal)
        return button
    }()
    
    public let trainLabel: UILabel = {
        let label = UILabel()
        label.text = "Ж/Д"
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textColor = Resources.Colors.purpleColor
        return label
    }()
    
    //BUS
    public let busView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .center
        return view
    }()
    public let busButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.BiletsIcons.Unselected.busIcon), for: .normal)
        return button
    }()
    
    public let busLabel: UILabel = {
        let label = UILabel()
        label.text = "Автобусы"
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textColor = Resources.Colors.purpleColor
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configure() {
        setupStackView()
        setupSubviews()
        setupButtonViews()
        setupConstraints()
    }
    
    private func setupStackView() {
        self.spacing = 20
        self.axis = .horizontal
    }
    
    private func setupSubviews() {
        addArrangedSubview(planeView)
        addArrangedSubview(trainView)
        addArrangedSubview(busView)
    }
    
    private func setupButtonViews() {
        planeView.addArrangedSubview(planeButton)
        planeView.addArrangedSubview(planeLabel)
        
        trainView.addArrangedSubview(trainButton)
        trainView.addArrangedSubview(trainLabel)
        
        busView.addArrangedSubview(busButton)
        busView.addArrangedSubview(busLabel)
    }
    
    private func setupConstraints() {
        [planeView, trainView, busView].forEach { sv in
            sv.snp.makeConstraints { make in
                make.width.equalTo(66)
                make.height.equalTo(93)
            }
        }
        
        [planeButton, trainButton, busButton].forEach { sv in
            sv.snp.makeConstraints { make in
                make.size.equalTo(66)
            }
        }
    }
    
    

}
