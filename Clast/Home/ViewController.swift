//
//  ViewController.swift
//  Clast
//
//  Created by Jackiossy on 2019/4/1.
//  Copyright © 2019 Jackiossy. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import CZXRefresh

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var news_all_data: NSArray?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home"
        tableView.register(UINib.init(nibName: "NewsCell", bundle: Bundle.main), forCellReuseIdentifier: "NewsCell_ID")
        loadAllData()
        tableView.czx_headerView = RefreshHeaderView(type: .image, action: headerRefresh)

        // Do any additional setup after loading the view.
    }
    
    func headerRefresh() {
        DispatchQueue.global().async {
            print("-------------------------正在刷新 header")
            sleep(2)
            DispatchQueue.main.async {
                [weak self] in
                print("-------------------------刷新完成 header")
//                self?.cellCount = 20
//                self?.cellName = "刷新"
                self?.loadAllData()

                self?.tableView.reloadData()

                self?.tableView.czx_headerView?.stopRefresh()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news_all_data?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewsCell = tableView.dequeueReusableCell(withIdentifier:"NewsCell_ID", for: indexPath) as! NewsCell
        if (news_all_data != nil) {
            let msg = self.news_all_data![indexPath.row] as! NSDictionary
            cell.news_title!.text = msg["title"] as? String
            cell.news_author!.text = msg["editor"] as? String
            
            let imags = msg["imgs"] as? NSArray
            let url = URL(string: ((imags![0]) as? String)!)
            cell.news_imageview?.kf.setImage(with: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details_vc = DetailsViewController.init()
        let msg = self.news_all_data![indexPath.row] as! NSDictionary
        details_vc.title = msg["title"] as? String
        let article_id =  msg["article_id"]
        print(article_id!);
        details_vc.article_id =  String("\(article_id!)")
            //String("\(article_id)")
        self.navigationController?.pushViewController(details_vc, animated: true)
    }
    
    //网络请求
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
                self.tableView.reloadData()
                print(self.news_all_data)
                //                let news = JSON as Dictionary
                //                print(news)
                //具体如何解析json内容可看下方“响应处理”部分
            }
        }
        
        
        
    }
    
    
    


}

