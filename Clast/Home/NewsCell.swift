//
//  NewsCell.swift
//  Clast
//
//  Created by Jackiossy on 2019/4/1.
//  Copyright © 2019 Jackiossy. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    ///新闻图片
    @IBOutlet weak var news_imageview: UIImageView!
    ///新闻标题
    @IBOutlet weak var news_title: UILabel!
    ///新闻作者
    @IBOutlet weak var news_author: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //修改新闻图片样式
        news_imageview.layer.cornerRadius = 5
        news_imageview.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
