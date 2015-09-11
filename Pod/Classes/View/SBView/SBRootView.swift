//
//  SBCompliantView.swift
//  Pods
//
//  Created by Nonchalant on 2015/08/01.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import UIKit

public class SBRootView: UIView, UIGestureRecognizerDelegate {
    
    private(set) var obj = SBDataObject()
    
    private var activeLong = false
    private var coverView = UIView()
    
    private var initOrigin: CGPoint?
    var absOrigin: CGPoint?
    var threshold: CGFloat = UIScreen.mainScreen().bounds.size.width + 45.0
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        coverView.frame = self.bounds
        coverView.backgroundColor = .blackColor()
        coverView.alpha = 0.15
        coverView.hidden = true
        self.addSubview(coverView)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: "pressed:")
        longGesture.minimumPressDuration = 0.25
        longGesture.delegate = self
        
        let panGesture = UIPanGestureRecognizer(target: self, action: "dragged:")
        panGesture.delegate = self
        
        self.userInteractionEnabled = true
        self.addGestureRecognizer(longGesture)
        self.addGestureRecognizer(panGesture)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func didMoveToSuperview() {
        initOrigin = self.frame.origin
        absOrigin = absPoint(self)
    }
    
    private func absPoint(view: UIView) -> CGPoint {
        var ret = view.frame.origin
        if let superview = view.superview {
            let addPoint = absPoint(superview)
            ret = CGPointMake(ret.x + addPoint.x, ret.y + addPoint.y)
        }
        return ret
    }
    
    public final func setIcon(img: UIImage) {
        obj.icon = img
    }
    
    public final func setDict(dict: [String: AnyObject]) {
        obj.dict = dict
    }
    
    final func setSBObject(data: SBDataObject) {
        obj = data
    }
    
    // MARK: UIGestureRecognizer
    
    final func pressed(sender: UILongPressGestureRecognizer) {
        switch sender.state {
            case .Began:
                activeLong = true
                coverView.hidden = false
                longPressStart()
            case .Ended:
                activeLong = false
                coverView.hidden = true
                longPressEnd()
            default:
                break
        }
    }
    
    final func dragged(sender: UIPanGestureRecognizer) {
        if (sender.state == .Ended) {
            panDragEnd()
            self.layer.frame.origin = initOrigin!
        } else {
            if (sender.state == .Began) { initOrigin = self.frame.origin }

            let delta = sender.translationInView(self)
            let movedPoint = CGPointMake(self.layer.frame.origin.x + delta.x, self.layer.frame.origin.y + delta.y)
            self.layer.frame.origin = movedPoint
            sender.setTranslation(CGPointZero, inView: self)
        }
        panDragAction()
    }
    
    // MARK: UIGestureMethod
    
    func longPressStart() {
        // override method
    }
    
    func longPressEnd() {
        // override method
    }
    
    func panDragEnd() {
        // override method
    }
    
    func panDragAction() {
        // override method
    }
    
    // MARK: - UIGestureRecognizerDelegate
    
    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override public func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {        
        if (gestureRecognizer.view is SBRootView) {            
            if (gestureRecognizer is UIPanGestureRecognizer) {
                return activeLong
            } else if (gestureRecognizer is UILongPressGestureRecognizer) {
                return true
            } else {
                return !activeLong
            }
        }
        return true
    }
}
