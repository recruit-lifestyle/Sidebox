//
//  DataModel.swift
//  Pods
//
//  Created by Nonchalant on 2015/07/31.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import Foundation

public class SBDataObject: NSObject {
    
    var id: Int?
    public var icon: UIImage?
    public var dict: [String: AnyObject]?
    
    override public init() {
        if let path = NSBundle(forClass: SBDataObject.self).pathForResource("Sidebox", ofType: "bundle") {
            let bundle = NSBundle(path: path)
            self.icon = UIImage(named: "default.png", inBundle: bundle, compatibleWithTraitCollection: nil)!
        }
    }
}
