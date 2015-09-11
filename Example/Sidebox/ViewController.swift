//
//  ViewController.swift
//  Sidebox
//
//  Created by Nonchalant on 07/29/2015.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import UIKit
import Sidebox

class ViewController: SBViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let model = Model()
    private let tableView = UITableView(frame: UIScreen.mainScreen().bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "検索結果"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.separatorStyle = .None
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let webViewCtr = WebViewController()
        if let dict = model.array[indexPath.row]["dict"] as? [String: AnyObject], title = dict["title"] as? String, url = dict["url"] as? String {
            webViewCtr.title = title
            webViewCtr.loadWebView(url)
        }
        self.navigationController?.pushViewController(webViewCtr, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier: String = "CellIdentifier[\(indexPath.row)]";
        
        if let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? UITableViewCell {
            return cell
        } else {
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
            
            let hline = UIView(frame: CGRectMake(12.5, 99.0, UIScreen.mainScreen().bounds.width-25.0, 1.0))
            hline.backgroundColor = .lightGrayColor()
            cell.contentView.addSubview(hline)
            
            let view = SBView(frame: CGRectMake(0.0, 0.0, UIScreen.mainScreen().bounds.width, 100.0))
            view.delegate = self
            view.setIcon(UIImage(named: model.array[indexPath.row]["icon"] as! String)!)
            view.setDict((model.array[indexPath.row]["dict"] as? [String: AnyObject])!)

            cell.contentView.addSubview(view)
            
            let underline = UIView(frame: CGRectMake(0.0, view.frame.size.height - 1.0, view.frame.size.width, 1.0))
            underline.backgroundColor = .lightGrayColor()
            cell.addSubview(underline)
            
            let icon = UIImageView(image: UIImage(named: model.array[indexPath.row]["icon"] as! String))
            icon.frame = CGRectMake(10.0, 10.0, 80.0, 80.0)
            view.addSubview(icon)
            
            let title = UILabel(frame: CGRectMake(100.0, 10.0, UIScreen.mainScreen().bounds.width-100.0-10.0, 30.0))
            title.text =  (model.array[indexPath.row]["dict"] as! [String: AnyObject])["title"] as? String
            view.addSubview(title)
            
            let description = UILabel(frame: CGRectMake(110.0, 40.0, UIScreen.mainScreen().bounds.width-110.0-10.0, 50.0))
            description.text = (model.array[indexPath.row]["dict"] as! [String: AnyObject])["description"] as? String
            description.font = UIFont.boldSystemFontOfSize(9.0)
            description.numberOfLines = 0
            view.addSubview(description)
            
            return cell
        }
    }
    
    // MARK: - SBViewDelegate
    
    override func editModeStart(view: SBView) {
        self.tableView.scrollEnabled = false
    }
    
    override func editModeEnd(view: SBView) {
        self.tableView.scrollEnabled = true
    }
    
    // MARK: - SBIconMethod
    
    override func iconTapped(data: SBDataObject) {
        let webViewCtr = WebViewController()
        if let dict = data.dict, title = dict["title"] as? String, url = dict["url"] as? String {
            webViewCtr.title = title
            webViewCtr.loadWebView(url)
        }
        self.navigationController?.pushViewController(webViewCtr, animated: true)
    }
}

