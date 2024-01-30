//
//  RegistrationVC+Alert.swift
//  Injir
//
//  Created by Александр Андреев on 27.01.2024.
//

import Foundation
import UIKit

extension RegistrationViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
