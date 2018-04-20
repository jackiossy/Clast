//
//  NewsCell.swift
//  Clast
//
//  Created by Jackiossy on 2018/4/18.
//

import UIKit

class NewsCell: UITableViewCell {
    
    var title: UILabel?
    var image_info: UIImageView?
    var author: UILabel?
    var news_time: UILabel?
    
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height

    override init(style:UITableViewCellStyle, reuseIdentifier:String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        add_all_views()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func add_all_views() {
        
        title = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: kScreenWidth - 155, height: 60))
        title?.numberOfLines = 0
        self .addSubview(title!)
        
        image_info = UIImageView.init(frame: CGRect.init(x: kScreenWidth - 145, y: 5, width: 140, height: 80))
        image_info?.backgroundColor = UIColor.red
        self .addSubview(image_info!)
        
        author = UILabel.init(frame: CGRect.init(x: 10, y: 60, width: kScreenWidth - 120, height: 25))
        author?.font = UIFont.systemFont(ofSize: 10)
        author?.textColor = UIColor.lightGray
        self .addSubview(author!)
        
    }

}
