//
//  ProfileViewController+Alerts.swift
//  Injir
//
//  Created by Александр Андреев on 31.01.2024.
//

import Foundation
import UIKit

extension ProfileViewController {
    
    func showAlert(title: String, competition: @escaping (String) -> Void){
        var alertTitle: String = ""
        var tfPlaceholder: String = ""
        
        if title == "Имя" {
            alertTitle = "Изменить имя"
            tfPlaceholder = "Введите новое имя"
        } else {
            alertTitle = "Изменить профессию"
            tfPlaceholder = "Введите новую профессию"
        }
            
        let alertController = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)

        
        alertController.addTextField { textField in
            textField.placeholder = tfPlaceholder
        }

        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

        alertController.addAction(UIAlertAction(title: "Сохранить", style: .default) { _ in
            if let title = alertController.textFields?.first?.text {
                competition(title)
            }
        })

        present(alertController, animated: true, completion: nil)
    }
    
    
}
