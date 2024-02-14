//
//  NetworkConstant.swift
//  Injir
//
//  Created by Александр Андреев on 12.02.2024.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //Singletone
    }
    
    public var newsApiKey: String {
        //API key from https://newsapi.org
        get {
            return "51b4460ea15a41d08f48d33aef26dc4f"
        }
        
    }
    
    public var serverAdress: String {
        get {
            return "https://newsapi.org/v2/top-headlines?country=ru"
        }
    }
    
    

}
