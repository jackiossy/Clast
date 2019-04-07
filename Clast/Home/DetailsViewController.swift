//
//  DetailsViewController.swift
//  Clast
//
//  Created by Jackiossy on 2019/4/1.
//  Copyright © 2019 Jackiossy. All rights reserved.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {
    var article_id = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Content"
        let w = self.view.frame.size.width
        let h = self.view.frame.size.height
        let wk_webview = WKWebView.init(frame: CGRect.init(x: 0, y: 0, width: w, height: h))
        self.view.addSubview(wk_webview)
        wk_webview.backgroundColor = UIColor.cyan
        

        print(article_id)
        let urlStr = "https://news.mydrivers.com/1/621/\(article_id).htm"
        print(urlStr)
        wk_webview.load(URLRequest.init(url: (URL.init(string:urlStr )!)))
        // Do any additional setup after loading the view.
    }
}
