//
//  NewsVC+TableView.swift
//  Injir
//
//  Created by Александр Андреев on 13.02.2024.
//

import Foundation
import UIKit

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func settingsForTableView() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.separatorColor = .clear
        newsTableView.backgroundColor = .clear
    }
    
    func registerCells() {
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.indetifier)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let article = viewModel.articles?[indexPath.row]
        let title = article?.title ?? ""
        
        let cellWidth = tableView.bounds.width - 36
        let titleLabelFont = UIFont.systemFont(ofSize: 17) // Замените этот шрифт на тот, который используется в вашей ячейке
        
        let titleBoundingRect = NSString(string: title).boundingRect(with: CGSize(width: cellWidth, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: titleLabelFont], context: nil)
        
        // Возвращаем высоту текста плюс некоторый отступ (например, 20)
        return titleBoundingRect.height + 15 + 41 + 10
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.indetifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let article = viewModel.articles?[indexPath.row]
        guard let article = article else {
            return UITableViewCell()
        }
        cell.setupCell(article: article)
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
