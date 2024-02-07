//
//  UITextField+Ext.swift
//  Injir
//
//  Created by Александр Андреев on 20.01.2024.
//

import Foundation
import UIKit

extension UITextField: UITextFieldDelegate {
    
    
    func generateTF(text: String) {
        // Устанавливаем отступ и цвет placeholder
        let paragraphStyle = NSMutableParagraphStyle()
        let placeholderColor = Resources.Colors.purpleColor.withAlphaComponent(0.7)
        paragraphStyle.firstLineHeadIndent = 25
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .paragraphStyle: paragraphStyle
        ]
        let attributedPlaceholder = NSAttributedString(string: text, attributes: placeholderAttributes)
        self.attributedPlaceholder = attributedPlaceholder
        
        self.layer.borderColor = Resources.Colors.purpleCGColor
        self.backgroundColor = .clear
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 21
        
        // Устанавливаем делегат для обработки событий текстового поля
        self.delegate = self
        // Устанавливаем цвет текста и отступ для текста
        paragraphStyle.firstLineHeadIndent = 25

        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Resources.Colors.purpleColor,  // Цвет текста
            .paragraphStyle: paragraphStyle
        ]

        self.defaultTextAttributes = textAttributes
    }
    
    func setPlaceholderColor(_ color: UIColor) {
            guard let placeholder = self.placeholder else { return }
            
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: color
            ]
            
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        }
}
