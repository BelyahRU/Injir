//
//  LanguageSelectionViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 23.01.2024.
//

import Foundation
class LanguageSelectionViewModel {
    
    var selectedLanguageObservable = Observable<String>("russia")
    
    let availableLanguages = ["russia", "uzbekistan", "uk", "turkmenistan", "tajikistan"]
    
    func selectLanguage(_ language: String) {
        selectedLanguageObservable.value = language
    }
    
    func deselectLanguage() {
        selectedLanguageObservable.value = nil
    }
    
}
