//
//  SBDataModel.swift
//  Pods
//
//  Created by Nonchalant on 2015/07/30.
//  Copyright (c) 2015 Nonchalant. All rights reserved.
//

import Foundation

internal class SBDataModel: NSObject {
    
    static let sharedInstance = SBDataModel()
    private(set) var array = [SBDataObject]()
    
    final func sbDataAdd(data: SBDataObject) {
        data.id = array.count
        array.append(data)
    }
    
    final func sbDataRemove(id: Int) {
        for (var i = 0 ; i < array.count ; i++) {
            if (array[i].id == id) {
                array.removeAtIndex(i)
                sbDataAlign(id)
                NSNotificationCenter.defaultCenter().postNotificationName("sbRemove", object: nil, userInfo: ["id": i])
                break
            }
        }
    }
    
    private func sbDataAlign(id: Int) {
        for (var i = id ; i < array.count ; i++) {
            array[i].id = i
        }
    }
}
