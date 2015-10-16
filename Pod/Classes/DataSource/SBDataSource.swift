//
//  SBDataSource.swift
//  Pods
//
//  Created by Nonchalant on 2015/07/30.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import UIKit

class SBDataSource: NSObject, UITableViewDataSource {
    
    final func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SBDataModel.sharedInstance.array.count
    }
    
    final func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = SBTableViewCell()
        cell.setIconView(SBDataModel.sharedInstance.array[indexPath.row])
        return cell
    }
}
