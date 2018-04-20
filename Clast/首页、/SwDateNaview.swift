//
//  SwDateNaview.swift
//  Clast
//
//  Created by Jackiossy on 2018/4/20.
//

import UIKit

class SwDateNaview: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height
    
    var date_view: UIView?
    var date_text: UILabel?
    var week_text: UILabel?
    var temperature_text: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.add_date_view()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func add_date_view() {
        date_view = UIView.init(frame: CGRect.init(x: 0, y: 0, width:kScreenWidth, height: 120))
        date_view?.backgroundColor = UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0)
        self.addSubview(date_view!)
        
        week_text = UILabel.init(frame: CGRect.init(x: 0, y: 10, width: kScreenWidth, height: 60))
        week_text?.text = "  快科技"
        week_text?.font = UIFont.boldSystemFont(ofSize: 26)
        week_text?.textColor = UIColor .white
        date_view?.addSubview(week_text!)
        
        date_text = UILabel.init(frame: CGRect.init(x: 0, y: 60, width: kScreenWidth, height: 60))
        date_text?.text = "  SEPTEMBER 12"
        date_text?.font = UIFont.boldSystemFont(ofSize: 32)
        date_view?.addSubview(date_text!)
        
        temperature_text = UILabel.init(frame: CGRect.init(x: kScreenWidth - 120, y: 75, width: kScreenWidth, height: 40))
        temperature_text?.text = "  30°"
        temperature_text?.font = UIFont.systemFont(ofSize: 18)
        date_view?.addSubview(temperature_text!)
        
        let news_imageview = UIImageView.init(frame: CGRect.init(x: kScreenWidth - 70, y: 70, width: 40, height: 40))
        news_imageview.image = UIImage.init(named: "news.png")
        date_view?.addSubview(news_imageview)
        
        let cut_line = UIView.init(frame: CGRect.init(x: 30, y: 120, width: kScreenWidth-60, height: 1))
        cut_line.backgroundColor = UIColor.lightGray
        date_view?.addSubview(cut_line)
    }
    

}
