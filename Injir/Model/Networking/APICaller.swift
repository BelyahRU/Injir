//
//  APICaller.swift
//  Injir
//
//  Created by Александр Андреев on 12.02.2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    static func getNews(completionHandler: @escaping (_ result: Result<NewsResponse, Error>) -> Void) {
        let urlString = NetworkConstant.shared.serverAdress + "&apiKey=" + NetworkConstant.shared.newsApiKey
        print(urlString)
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(NetworkError.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil , let data = dataResponse {
                do {
                    let decoder = JSONDecoder() // создаем экземпляр JSON декодера
                    //Устанавливает стратегию декодирования для дат в формате ISO8601, что означает, что даты в JSON будут автоматически преобразованы в объекты Date.
                    decoder.dateDecodingStrategy = .iso8601
                    let resultData = try decoder.decode(NewsResponse.self, from: data)
                    completionHandler(.success(resultData))
                } catch {
                    completionHandler(.failure(NetworkError.canNotParseData))
                }
            } else {
                completionHandler(.failure(NetworkError.canNotParseData))
            }
            
        }.resume()
    }
}

