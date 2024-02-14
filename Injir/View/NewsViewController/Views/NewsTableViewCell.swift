//
//  NewsTableViewCell.swift
//  Injir
//
//  Created by Александр Андреев on 13.02.2024.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.purpleColor
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.purpleColor
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.purpleColorAlpha70
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let roundedView: UIView = {
        let view = UIView()
        view.makeBorders(width: 3)
        view.makeRadius(radius: 21)
        view.makeBordersColor(color: Resources.Colors.purpleCGColor)
        return view
    }()
    
    public static var indetifier: String {
        get {
            return "NewsTableViewCell"
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(roundedView)
        roundedView.addSubview(titleLabel)
        roundedView.addSubview(authorLabel)
        roundedView.addSubview(dateLabel)
        
        
        roundedView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
//            make.leading.equalToSuperview().offset(18)
//            make.trailing.equalToSuperview().inset(18)
            make.width.equalTo(UIScreen.main.bounds.width-36)
            make.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(41)
            make.bottom.equalToSuperview().inset(14)
        }
        authorLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.top)
            make.leading.equalTo(authorLabel.snp.trailing).offset(10)
        }
    }
   
    
    public func setupCell(article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author
        dateLabel.text = article.publishedAt
    }
    
}
