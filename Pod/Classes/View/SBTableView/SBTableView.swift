//
//  SBTableView.swift
//  Pods
//
//  Created by Nonchalant on 2015/07/30.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import UIKit

public class SBTableView: UITableView, UITableViewDelegate {
    
    private let ___dataSource = SBDataSource()
    private var edit = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "removeIcon:", name: "sbRemove", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "edit:", name: "sbEdit", object: nil)
        
        self.delegate = self
        self.dataSource = ___dataSource
        self.backgroundColor = .whiteColor()
        self.rowHeight = 60.0
        self.separatorStyle = .None
        self.clipsToBounds = false
        
        let leftLine = UIView(frame: CGRectMake(0.0, -self.frame.size.height/2.0, 1.0, self.frame.size.height*2))
        leftLine.backgroundColor = .grayColor()
        self.addSubview(leftLine)
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final func focus(hover: Bool) {
        if (hover) {
            self.backgroundColor = .grayColor()
            self.alpha = 0.2
        } else {
            self.backgroundColor = .whiteColor()
            self.alpha = 1.0
        }
    }
    
    final func derive(derive: Bool) {
        if (derive) {
            self.center = CGPointMake(UIScreen.mainScreen().bounds.width - self.frame.size.width/2.0, self.center.y)
        } else {
            self.center = CGPointMake(UIScreen.mainScreen().bounds.width + self.frame.size.width/2.0, self.center.y)
        }
    }
    
    // MARK: - NSNotification
    
    final func removeIcon(notification: NSNotification?) {
        if let userInfo = notification!.userInfo, index = userInfo["id"] as? Int {
            if let cell = self.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0)) { cell.alpha = 0 }                
            self.beginUpdates()
            self.deleteRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Fade)
            self.endUpdates()
            self.reloadData()
        }
    }
    
    // MARK: - UITableViewDelegate
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
