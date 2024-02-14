//
//  MainViewController.swift
//  Injir
//
//  Created by Александр Андреев on 27.01.2024.
//

import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    func logOutButtonTapped()
}

class MainTabBarViewController: UITabBarController, ProfileViewControllerDelegate {
    
    weak var mainDelegate: MainTabBarControllerDelegate?
    
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
    
    func logOutButtonTapped() {
        mainDelegate?.logOutUser()
        print("OK")
    }
    
}

//Settings For TabBar
extension MainTabBarViewController {
    private func generateTabBar() {
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .clear
           
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = .none
        }
        
        let profileVC = ProfileViewController()
        profileVC.delegate = self
        let navigProfile = UINavigationController(rootViewController: profileVC)
        navigProfile.navigationBar.isHidden = true
        let biletsVC = TicketsViewController()
        let newsVC = NewsViewController()
        
        
        viewControllers = [
            generateVC(viewController: newsVC, image: UIImage(named: Resources.TabBarItems.newsIcon), title: "Новости"),
            generateVC(viewController: navigProfile, image: UIImage(named: Resources.TabBarItems.profileIcon), title: "Профиль"),
            generateVC(viewController: biletsVC, image: UIImage(named: Resources.TabBarItems.biletsIcon), title: "Билеты")
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
