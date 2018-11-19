//
//  NewsDataSource.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import UIKit


class NewsDataSource: NSObject {
    var arrNews: [NewsResult]
    init(news: [NewsResult]) {
        self.arrNews = news
    }
}

extension NewsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCellNewsList.self)) as! TableViewCellNewsList
        let cellNews = arrNews[indexPath.row]
        cell.headLineText = cellNews.title ?? ""
        cell.author = cellNews.byline ?? "By Source"
        
        if let publishDate =  Formatters.dayMonthYearFormatter.date(from: cellNews.publishedDate ?? "") {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            cell.publishDate = dateFormatter.string(from: publishDate)
            
        }else{
            cell.publishDate = cellNews.publishedDate ?? ""
        }
        
        cell.image_News.layer.cornerRadius = cell.image_News.frame.height/2
        cell.image_News.layer.masksToBounds = true
        cell.image_News.backgroundColor = UIColor(0.2)
        cell.image_News.loadImageAsync(with: cellNews.media?.first?.mediaMetadata?.first?.url )
        return cell
    }
}
