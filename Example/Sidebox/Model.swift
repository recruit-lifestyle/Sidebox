//
//  Model.swift
//  Sidebox
//
//  Created by Nonchalant on 2015/08/04.
//  Copyright (c) 2015年 CocoaPods. All rights reserved.
//

import Foundation

class Model: NSObject {
    
    var array = [[String: AnyObject]]()

    override init() {
        array.append(["icon": "home", "dict": ["title": "Home", "description": "description for home"]])
        array.append(["icon": "music", "dict": ["title": "Music", "description": "description for music"]])
        array.append(["icon": "video", "dict": ["title": "Video", "description": "description for video"]])
        array.append(["icon": "picture", "dict": ["title": "Picture", "description": "description for picture"]])
        array.append(["icon": "book", "dict": ["title": "Book", "description": "description for book"]])
        array.append(["icon": "folder", "dict": ["title": "Folder", "description": "description for folder"]])
        array.append(["icon": "network", "dict": ["title": "network", "description": "description for network"]])
    }
}
