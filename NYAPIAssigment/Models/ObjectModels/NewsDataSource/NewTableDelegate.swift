//
//  NewTableDelegate.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 19/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import UIKit

class NewsTableDelegate : NSObject {
    
    var news: [NewsResult]
    
    init(tableView: UITableView, news: [NewsResult]) {
        self.news = news
        super.init()
        tableView.delegate = self
    }
    
}

