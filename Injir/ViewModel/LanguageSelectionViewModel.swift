//
//  LanguageSelectionViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 23.01.2024.
//

import Foundation
class LanguageSelectionViewModel {
    
    // Observable для отслеживания выбранного языка
    var selectedLanguageObservable = Observable<String>("russia")
    
    // Доступные языки
    let availableLanguages = ["russia", "uzbekistan", "uk", "turkmenistan", "tajikistan"]
    
    // Метод для выбора языка
    func selectLanguage(_ language: String) {
        // Устанавливаем выбранный язык
        selectedLanguageObservable.value = language
    }
    
    func deselectLanguage() {
        selectedLanguageObservable.value = nil
    }
    
}
