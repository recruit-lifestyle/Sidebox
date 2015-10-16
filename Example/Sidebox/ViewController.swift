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
    
    let model = Model()
    let tableView = UITableView(frame: UIScreen.mainScreen().bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            
            let view = SBView(frame: CGRectMake(0.0, 0.0, UIScreen.mainScreen().bounds.width, 100.0))
            view.delegate = self
            view.setIcon(UIImage(named: model.array[indexPath.row]["icon"] as! String)!)
            view.setDict((model.array[indexPath.row]["dict"] as? [String: AnyObject])!)

            cell.contentView.addSubview(view)
            
            let underline = UIView(frame: CGRectMake(0.0, view.frame.size.height - 1.0, view.frame.size.width, 1.0))
            underline.backgroundColor = .lightGrayColor()
            cell.addSubview(underline)
            
            let icon = UIImageView(image: UIImage(named: model.array[indexPath.row]["icon"] as! String))
            icon.frame = CGRectMake(27.5, 27.5, 45.0, 45.0)
            view.addSubview(icon)
            
            let title = UILabel(frame: CGRectMake(100.0, 20.0, UIScreen.mainScreen().bounds.width-100.0-10.0, 30.0))
            title.text =  (model.array[indexPath.row]["dict"] as! [String: AnyObject])["title"] as? String
            title.font = UIFont.boldSystemFontOfSize(24.0)
            view.addSubview(title)
            
            let description = UILabel(frame: CGRectMake(110.0, 50.0, UIScreen.mainScreen().bounds.width-110.0-10.0, 30.0))
            description.text = (model.array[indexPath.row]["dict"] as! [String: AnyObject])["description"] as? String
            description.font = UIFont.boldSystemFontOfSize(14.0)
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
        println(data.dict)
    }
}

