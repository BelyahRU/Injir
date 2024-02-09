//
//  Extensions.swift
//  Injir
//
//  Created by Александр Андреев on 09.02.2024.
//

import Foundation
// Расширение DateFormatter для удобного форматирования даты рождения
extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX") // Устанавливаем локаль для форматирования
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // Устанавливаем часовой пояс
        return formatter
    }()
}
