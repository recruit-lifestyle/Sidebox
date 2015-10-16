//
//  SBView.swift
//  Pods
//
//  Created by Nonchalant on 2015/08/05.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import UIKit

public protocol SBViewDelegate {
    func editModeStart(view: SBView)
    func editModeEnd(view: SBView)
}

public class SBView: SBRootView {
    
    public var delegate: SBViewDelegate?
    
    public final func setIcon(img: UIImage) {
        obj.icon = img
    }
    
    public final func setDict(dict: [String: AnyObject]) {
        obj.dict = dict
    }
    
    // MARK: UIGestureMethod
    
    override final func longPressStart() {
        editModeStart(self)
        NSNotificationCenter.defaultCenter().postNotificationName("sbDerive", object: nil, userInfo: ["State": true])
    }
    
    override final func longPressEnd() {
        editModeEnd(self)
        NSNotificationCenter.defaultCenter().postNotificationName("sbDerive", object: nil, userInfo: ["State": false])
    }
    
    override final func panDragEnd() {
        if (self.frame.origin.x + absOrigin!.x + self.frame.size.width > threshold) {
            NSNotificationCenter.defaultCenter().postNotificationName("sbSave", object: nil, userInfo: ["Object": obj])
        }
    }
    
    override final func panDragAction() {
        let hover = (self.frame.origin.x + absOrigin!.x + self.frame.size.width > threshold) ? true : false
        NSNotificationCenter.defaultCenter().postNotificationName("sbHover", object: nil, userInfo: ["Hover": hover])
    }
    
    // MARK: - SBViewDelegate
    
    final func editModeStart(view: SBView) {
        delegate?.editModeStart(view)
    }
    
    final func editModeEnd(view: SBView) {
        delegate?.editModeEnd(view)
    }
}
