//
//  Resources.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import Foundation
import UIKit

enum Resources {
    
    enum Colors {
        static let purpleColor = UIColor(red: 66/255, green: 12/255, blue: 93/255, alpha: 1.0)
        static let purpleColorAlpha70 = UIColor(red: 66/255, green: 12/255, blue: 93/255, alpha: 0.7)
        static let purpleCGColor = CGColor(red: 66/255, green: 12/255, blue: 93/255, alpha: 1.0)
        static let whiteCGColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
    
    enum Images {
        static let logoImage = "logo"
        static let avatarImage = "avatar"
    }
    
    enum Buttons {
        static let backButton = "backArrow"
        static let editButton = "editImage"
        
    }
    
    enum TabBarItems {
        static let newsIcon = "newsSelected"
        static let servicesIcon = "servicesSelected"
        static let profileIcon = "profileSelected"
    }
    
}
