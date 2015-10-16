//
//  SBIconView.swift
//  Pods
//
//  Created by Nonchalant on 2015/07/31.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import UIKit

class SBIconView: SBRootView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, data: SBDataObject) {
        super.init(frame: frame)
        
        let iv = UIImageView(image: data.icon)
        iv.frame = CGRectMake(7.5, 7.5, 45.0, 45.0)
        self.addSubview(iv)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "tapped:")
        tapGesture.delegate = self
        self.addGestureRecognizer(tapGesture)
    }
    
    // MARK: UIGestureMethod
    
    override final func panDragEnd() {
        if (self.frame.origin.x + absOrigin!.x + self.frame.size.width < 0.0) {
            if let id = obj.id { SBDataModel.sharedInstance.sbDataRemove(id) }
        }
    }
    
    // MARK: UIGestureRecognizer
    
    final func tapped(sender: UITapGestureRecognizer) {
        NSNotificationCenter.defaultCenter().postNotificationName("sbTap", object: nil, userInfo: ["Object": obj])
    }
    
    // MARK: - TouchAction
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.backgroundColor = .lightGrayColor()
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.backgroundColor = .clearColor()
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        self.backgroundColor = .clearColor()
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.backgroundColor = .clearColor()
    }
}
