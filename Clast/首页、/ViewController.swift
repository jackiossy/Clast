//
//  ViewController.swift
//  Clast
//
//  Created by Jackiossy on 2018/4/3.
//

import UIKit
import Alamofire
import Kingfisher
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var news_all_data: NSArray?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (news_all_data != nil) {
            return (news_all_data?.count)!

        }
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news_cell", for: indexPath) as! NewsCell
        if (news_all_data != nil) {
            let msg = self.news_all_data![indexPath.row] as! NSDictionary
            cell.title!.text = msg["title"] as? String
            cell.author!.text = msg["editor"] as? String

            let imags = msg["imgs"] as? NSArray
            let url = URL(string: ((imags![0]) as? String)!)
            cell.image_info?.kf.setImage(with: url)
        }
        return cell
    }
    
    var main_view: MainView?
    override func viewDidLoad() {
        super.viewDidLoad()
        main_view = MainView()
        self.view = main_view
        main_view?.news_table?.delegate = self as UITableViewDelegate
        main_view?.news_table?.dataSource = self as UITableViewDataSource
        main_view?.news_table?.register(NewsCell.self, forCellReuseIdentifier: "news_cell")
        loadAllData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func loadAllData() {
        //网络请求
        Alamofire.request("http://dt.kkeji.com/api/2/contents?istop=0&xaid=0939f667759c38b1ba31df883c703f59b6e82b77&sign=-493585592&udid=4770436061523232933&maxid=0&tid=1&cid=6").responseJSON { response in
            switch response.result.isSuccess {
            case true:
                print("数据获取成功!")
            case false:
                print(response.result.error!)
            }
            
            if let JSON  = response.result.value as? NSDictionary {
                let data = JSON["data"] as? NSDictionary
                self.news_all_data = NSMutableArray.init()
                self.news_all_data = data!["news"] as! NSArray
                self.main_view?.news_table?.reloadData()
                print(self.news_all_data)
//                let news = JSON as Dictionary
//                print(news)
                //具体如何解析json内容可看下方“响应处理”部分
            }
        }
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

