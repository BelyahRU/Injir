//
//  NewsViewModel.swift
//  Injir
//
//  Created by Александр Андреев on 13.02.2024.
//

import Foundation

class NewsViewModel {
    
    var dataSource: NewsResponse?
    var articles: [Article]?
    
    func getData() {
        APICaller.getNews { result in
            
            switch result {
            case .success(let data):
                print("Count \(data.totalResults)")
                self.dataSource = data
                self.articles = data.articles
                self.changeTitles()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func changeTitles() {
        if articles == nil {
            return
        }
        for i in 0..<articles!.count{
            while true {
                if articles![i].title.contains(" - \(articles![i].author)") {
                    articles![i].title = articles![i].title.replacingOccurrences(of: " - \(articles![i].author)", with: "")
                } else {
                    break
                }
            }
            
            articles![i].publishedAt = String(articles![i].publishedAt.prefix(10))
        }
        
    
    }
    
    func numberOfRows() -> Int {
        self.dataSource?.articles.count ?? 0
    }
}
