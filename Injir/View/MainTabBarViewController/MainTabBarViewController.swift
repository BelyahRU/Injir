//
//  MainViewController.swift
//  Injir
//
//  Created by Александр Андреев on 27.01.2024.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    private let customTabBarView: UIView = {
        let view = UIView()
        view.roundTopCorners(radius: 21)
        view.makeBordersColor(color: Resources.Colors.purpleCGColor)
        view.makeBorders(width: 3)
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        configure()
    }
    
    private func configure() {
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupView() {
        tabBar.unselectedItemTintColor = Resources.Colors.purpleColorAlpha70
        tabBar.tintColor = Resources.Colors.purpleColor
        view.backgroundColor = .white
        
        selectedIndex = 1
        
    }
    
    private func setupSubviews() {
        view.addSubview(customTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
    
    
    private func setupConstraints() {
        customTabBarView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalTo(393)
            make.height.equalTo(90)
            make.centerX.equalToSuperview()
        }
    }
    
}

//Settings For TabBar
extension MainTabBarViewController {
    private func generateTabBar() {
        let profileVC = ProfileViewController()
        let servicesVC = ServicesViewController()
        let newsVC = NewsViewController()
        
        
        viewControllers = [
            generateVC(viewController: newsVC, image: UIImage(named: Resources.TabBarItems.newsIcon), title: "Новости"),
            generateVC(viewController: profileVC, image: UIImage(named: Resources.TabBarItems.profileIcon), title: "Профиль"),
            generateVC(viewController: servicesVC, image: UIImage(named: Resources.TabBarItems.servicesIcon), title: "Cервисы")
        ]
    }
    
    private func generateVC(viewController: UIViewController, image: UIImage?, title: String) -> UIViewController {
        
        viewController.tabBarItem.image = image
        viewController.tabBarItem.title = title
        // Увеличение расстояния между Title и Image
        viewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 6)
        return viewController
    }
}
