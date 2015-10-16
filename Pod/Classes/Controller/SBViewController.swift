//
//  SBViewController.swift
//  Pods
//
//  Created by Nonchalant on 2015/07/30.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import UIKit

public class SBViewController: UIViewController, SBViewDelegate {
    
    public let sidebox = SBTableView(frame: CGRectMake(UIScreen.mainScreen().bounds.size.width, 64.0,
                                                  60.0, UIScreen.mainScreen().bounds.size.height - 64.0))
    private var derived = false
    private var animation = false
    private var hold = false
    
    convenience public init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override public init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nil, bundle: nil)
        initializer()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializer()
    }
    
    private func initializer() {
        self.view.addSubview(sidebox)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hovered:", name: "sbHover", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "derived:", name: "sbDerive", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "save:", name: "sbSave", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "tapped:", name: "sbTap", object: nil)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: "swiped:")
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeLeftGesture.direction = UISwipeGestureRecognizerDirection.Left
        
        self.view.addGestureRecognizer(swipeRightGesture)
        self.view.addGestureRecognizer(swipeLeftGesture)
    }
    
    // MARK: - NSNotification
    
    final func hovered(notification: NSNotification?) {
        if let userInfo = notification!.userInfo, hover = userInfo["Hover"] as? Bool {
            sidebox.focus(hover)
        }
    }
    
    final func derived(notification: NSNotification?) {
        if let userInfo = notification!.userInfo, state = userInfo["State"] as? Bool {
            hold = state
            deriveSidebox(derived || !state)
        }
    }
    
    final func save(notification: NSNotification?) {
        if let userInfo = notification!.userInfo, object = userInfo["Object"] as? SBDataObject {
            SBDataModel.sharedInstance.sbDataAdd(object)
            sidebox.reloadData()
        }
    }
    
    final func tapped(notification: NSNotification?) {
        if let userInfo = notification!.userInfo, object = userInfo["Object"] as? SBDataObject {
            iconTapped(object)
        }
    }
    
    public func iconTapped(data: SBDataObject) {
        // override method
    }
    
    // MARK: - UIGestureRecognizer
    
    final func swiped(sender: UISwipeGestureRecognizer) {
        if ((sender.direction == .Left && sidebox.frame.origin.x == UIScreen.mainScreen().bounds.width) ||
            (sender.direction == .Right && sidebox.frame.origin.x == UIScreen.mainScreen().bounds.width - sidebox.frame.size.width)) {
                deriveSidebox(hold)
        }
    }
    
    private func deriveSidebox(invalid: Bool) {
        if (animation || invalid) { return }

        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.animation = true
            self.derived = (self.sidebox.frame.origin.x == UIScreen.mainScreen().bounds.width) ? true : false
            self.sidebox.derive(self.derived)
            self.shiftAllSubView()
        }) { (Bool) -> Void in
            self.animation = false
        }
    }
    
    private func shiftAllSubView() {
        var delta = self.sidebox.frame.size.width
        if (self.derived) { delta = -delta }
        
        for v in self.view.subviews {
            if !(v is SBTableView) {
                var extend: CGFloat = 0.0
                if (v.frame.size.width == UIScreen.mainScreen().bounds.width) {
                    extend = sidebox.frame.size.width
                } else if (v.frame.size.width == UIScreen.mainScreen().bounds.width + sidebox.frame.size.width
                            && v.frame.origin.x == -sidebox.frame.size.width) {
                    extend = -sidebox.frame.size.width
                }
                
                (v as! UIView).frame = CGRectMake(v.frame.origin.x + delta, v.frame.origin.y, v.frame.size.width + extend, v.frame.size.height)
            }
        }
    }
    
    // MARK: - SBViewDelegate
    
    public func editModeStart(view: SBView) {
        // override method
    }
    
    public func editModeEnd(view: SBView) {
        // override method
    }
}
