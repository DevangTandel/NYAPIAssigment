//
//  TableViewCellNewsList.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import UIKit

class TableViewCellNewsList: UITableViewCell {
    
    @IBOutlet weak var image_News: UIImageView!
    @IBOutlet weak var lblHeadlines: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblPublishDate: UILabel!
    
    
    var headLineText: String? {
        didSet {
            lblHeadlines.text = headLineText
        }
    }
    
    var author: String? {
        didSet {
            lblAuthor.text = author
        }
    }
    
    var publishDate: String? {
        didSet {
            lblPublishDate.text = publishDate
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
