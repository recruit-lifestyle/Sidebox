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
        array.append(["icon": "Turugi",
                      "dict": ["title": "焼麺 劔",
                               "description": "茹でた麺を鉄板で片面香ばしく焼き、丼に盛ってスープを入れた新感覚ラーメン、「焼麺（やきめん）」をメインに提供する店。",
                               "url": "http://tabelog.com/tokyo/A1305/A130503/13121750/"]])
        
        array.append(["icon": "812",
                      "dict": ["title": "8 1／2",
                               "description": "茹でた麺を鉄板で片面香ばしく焼き、丼に盛ってスープを入れた新感覚ラーメン、「焼麺（やきめん）」をメインに提供する店。",
                               "url": "http://tabelog.com/tokyo/A1317/A131711/13043827/"]])
        
        array.append(["icon": "Kesuke",
                      "dict": ["title": "肉そば総本山けいすけ",
                               "description": "茹でた麺を鉄板で片面香ばしく焼き、丼に盛ってスープを入れた新感覚ラーメン、「焼麺（やきめん）」をメインに提供する店。",
                               "url": "http://tabelog.com/tokyo/A1310/A131003/13122436/"]])
        
        array.append(["icon": "Turutontan",
                      "dict": ["title": "つるとんたん",
                               "description": "茹でた麺を鉄板で片面香ばしく焼き、丼に盛ってスープを入れた新感覚ラーメン、「焼麺（やきめん）」をメインに提供する店。",
                               "url": "http://tabelog.com/tokyo/A1304/A130401/13024799/"]])
        
        array.append(["icon": "Waigaya",
                      "dict": ["title": "WAIGAYA",
                               "description": "茹でた麺を鉄板で片面香ばしく焼き、丼に盛ってスープを入れた新感覚ラーメン、「焼麺（やきめん）」をメインに提供する店。",
                               "url": "http://tabelog.com/tokyo/A1304/A130401/13167240/"]])
        
        array.append(["icon": "Moyan",
                      "dict": ["title": "もうやんカレー",
                               "description": "茹でた麺を鉄板で片面香ばしく焼き、丼に盛ってスープを入れた新感覚ラーメン、「焼麺（やきめん）」をメインに提供する店。",
                               "url": "http://tabelog.com/tokyo/A1304/A130401/13001046/"]])
        
//        array.append(["icon": "home", "dict": ["title": "Home", "description": "description for home"]])
//        array.append(["icon": "music", "dict": ["title": "Music", "description": "description for music"]])
//        array.append(["icon": "video", "dict": ["title": "Video", "description": "description for video"]])
//        array.append(["icon": "picture", "dict": ["title": "Picture", "description": "description for picture"]])
//        array.append(["icon": "book", "dict": ["title": "Book", "description": "description for book"]])
//        array.append(["icon": "folder", "dict": ["title": "Folder", "description": "description for folder"]])
//        array.append(["icon": "network", "dict": ["title": "network", "description": "description for network"]])
    }
}
