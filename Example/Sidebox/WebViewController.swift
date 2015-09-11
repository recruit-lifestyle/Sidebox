//
//  WebViewController.swift
//  Sidebox
//
//  Created by Takeshi Ihara on 2015/09/04.
//  Copyright (c) 2015年 CocoaPods. All rights reserved.
//

import UIKit
import Sidebox

class WebViewController: SBViewController {
    
    let webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = self.view.bounds
        self.view.addSubview(webView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    final func loadWebView (urlStr: String) {
        let url = NSURL(string: urlStr)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
}

