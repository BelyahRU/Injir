//
//  UIButton+Ext.swift
//  Injir
//
//  Created by Александр Андреев on 22.01.2024.
//

import Foundation
import UIKit

extension UIButton {
    
    public func createPurpleTitle(text: String) {
        self.setTitleColor(Resources.Colors.purpleColor, for: .normal)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 20)
    }
    
}
