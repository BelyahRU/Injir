//
//  SceneDelegate.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore

protocol MainTabBarControllerDelegate: AnyObject {
    func logOutUser()
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, MainTabBarControllerDelegate {

    var window: UIWindow?
    var windowScenee: UIWindowScene?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        windowScenee = windowScene
        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                self.userNotAuth()
            } else {
                self.userAuth()
            }
        }
        
        
    }
    
    func logOutUser() {
        do {
            try Auth.auth().signOut()
            userNotAuth()
        } catch {
            print("ERROR with signOut user")
        }
    }

    func userNotAuth() {
        window = UIWindow(windowScene: windowScenee!)
        window?.windowScene = windowScenee
        window?.makeKeyAndVisible()
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.navigationBar.isHidden = true
        window?.rootViewController = homeVC
    }
    
    func userAuth() {
        window = UIWindow(windowScene: windowScenee!)
        window?.windowScene = windowScenee
        window?.makeKeyAndVisible()
        let mainVC = MainTabBarViewController()
        mainVC.mainDelegate = self
        let navMainVC = UINavigationController(rootViewController: mainVC)
        navMainVC.navigationBar.isHidden = true
        window?.rootViewController = mainVC
    }


}

