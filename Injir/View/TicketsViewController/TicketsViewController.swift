//
//  ServicesViewController.swift
//  Injir
//
//  Created by Александр Андреев on 30.01.2024.
//

import UIKit

class TicketsViewController: UIViewController {
    
    private let ticketsView = TicketsView()
    private let viewModel = TicketsViewModel()
    
    enum TicketType: Int {
        case aviation = 0
        case train = 1
        case bus = 2
    }
    
    enum ClassOfService: Int {
        case bussines = 0
        case econom = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    private func configure() {
        connectViewModel()
        setupView()
        setupButtons()
    }
    
    private func connectViewModel() {
        viewModel.ticketTypeObservable.bind { [weak self] selectedTicketType in
            self?.updateUIForSelectedType(type: selectedTicketType!)
        }
    }
    
    private func setupView() {
        view.addSubview(ticketsView)
        ticketsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupButtons() {
        
        //ticket type
        ticketsView.transportTypeStackView.planeButton.addTarget(self, action: #selector(planePressed), for: .touchUpInside)
        ticketsView.transportTypeStackView.trainButton.addTarget(self, action: #selector(trainPressed), for: .touchUpInside)
        ticketsView.transportTypeStackView.busButton.addTarget(self, action: #selector(busPressed), for: .touchUpInside)
        
        ticketsView.directionView.swapCitiesButton.addTarget(self, action: #selector(swapCities), for: .touchUpInside)
        
        
    }
}

//Actions
extension TicketsViewController {
    
    @objc func swapCities() {
        let text = ticketsView.directionView.fromTF.text
        
        ticketsView.directionView.fromTF.text = ticketsView.directionView.toTF.text
        ticketsView.directionView.toTF.text = text
        
    }
    
    @objc func planePressed() {
        viewModel.changeTicketType(type: TicketType.aviation)
    }
    
    @objc func trainPressed() {
        viewModel.changeTicketType(type: TicketType.train)
    }
    
    @objc func busPressed() {
        viewModel.changeTicketType(type: TicketType.bus)
    }
}
//Update UI
extension TicketsViewController {
    private func updateUIForSelectedType(type: TicketType) {
        switch type {
        case .aviation:
            ticketsView.transportTypeStackView.planeButton.setImage(UIImage(named: Resources.BiletsIcons.Selected.planeIcon), for: .normal)
            ticketsView.transportTypeStackView.busButton.setImage(UIImage(named: Resources.BiletsIcons.Unselected.busIcon), for: .normal)
            ticketsView.transportTypeStackView.trainButton.setImage(UIImage(named: Resources.BiletsIcons.Unselected.trainIcon), for: .normal)
            break
        case .train:
            ticketsView.transportTypeStackView.planeButton.setImage(UIImage(named: Resources.BiletsIcons.Unselected.planeIcon), for: .normal)
            ticketsView.transportTypeStackView.busButton.setImage(UIImage(named: Resources.BiletsIcons.Unselected.busIcon), for: .normal)
            ticketsView.transportTypeStackView.trainButton.setImage(UIImage(named: Resources.BiletsIcons.Selected.trainIcon), for: .normal)
            break
        case .bus:
            ticketsView.transportTypeStackView.planeButton.setImage(UIImage(named: Resources.BiletsIcons.Unselected.planeIcon), for: .normal)
            ticketsView.transportTypeStackView.busButton.setImage(UIImage(named: Resources.BiletsIcons.Selected.busIcon), for: .normal)
            ticketsView.transportTypeStackView.trainButton.setImage(UIImage(named: Resources.BiletsIcons.Unselected.trainIcon), for: .normal)
            break
        }
    }
}
