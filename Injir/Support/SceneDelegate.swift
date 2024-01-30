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

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var windowScenee: UIWindowScene?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        windowScenee = windowScene
        //обсервер, который следит за тем, авторизован пользователь или нет
        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                self.userNotAuth()
            }
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
        
    }


}
