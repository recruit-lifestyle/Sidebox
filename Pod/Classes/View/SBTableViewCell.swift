//
//  SBTableViewCell.swift
//  Pods
//
//  Created by Nonchalant on 2015/08/03.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import UIKit

internal class SBTableViewCell: UITableViewCell {
        
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clearColor()
        self.selectionStyle = .None
        self.clipsToBounds = false
        
        let leftLine = UIView(frame: CGRectMake(0.0, 0.0, 1.0, 60.0))
        leftLine.backgroundColor = .grayColor()
        self.contentView.addSubview(leftLine)
    }
    
    final func setIconView(data: SBDataObject) {
        let icon = SBIconView(frame: CGRectMake(0.0, 0.0, 60.0, 60.0), data: data)
        icon.obj = data
        self.contentView.addSubview(icon)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
