//
//  MainView.swift
//  Clast
//
//  Created by Jackiossy on 2018/4/18.
//

import UIKit

class MainView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
     */
    
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height

  
    var news_table: UITableView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.add_news_tableview()
    }
    
    
    func add_news_tableview() {
        news_table = UITableView.init(frame: CGRect.init(x: 0, y: 120, width: kScreenWidth, height: kScreenHeight - 120), style: UITableViewStyle.grouped)
        self .addSubview(news_table!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    

}
