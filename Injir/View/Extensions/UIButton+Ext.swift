//
//  UIButton+Ext.swift
//  Injir
//
//  Created by Александр Андреев on 22.01.2024.
//

import Foundation
import UIKit

extension UIButton {
    
    public func generatePurpleButton(text: String) {
        makeBorder()
        makeRadius()
        self.setTitleColor(Resources.Colors.purpleColor, for: .normal)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 20)
    }
    
    private func makeBorder() {
        self.layer.borderWidth = 3
        self.layer.borderColor = Resources.Colors.purpleCGColor
    }
    
    private func makeRadius() {
        self.layer.cornerRadius = 21
    }
}
