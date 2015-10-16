# Sidebox

[![Version](https://img.shields.io/cocoapods/v/Sidebox.svg?style=flat)](http://cocoapods.org/pods/Sidebox)
[![License](https://img.shields.io/cocoapods/l/Sidebox.svg?style=flat)](http://cocoapods.org/pods/Sidebox)
[![Platform](https://img.shields.io/cocoapods/p/Sidebox.svg?style=flat)](http://cocoapods.org/pods/Sidebox)

## OverView

`Sidebox` has a scrollView on the right side of the view that is called **Sidebox**

`Sidebox` enables user to
* temporary storage
* quick comparison
in a single view

![Animation](https://github.com/recruit-lifestyle/Sidebox/wiki/images/animation.gif)  

## Requirements

iOS: 8.0  
cocoapods: 0.36.0

## Installation

Sidebox is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
pod "Sidebox"
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Introduction ***Sidebox*** to your project is very simple as below:
```swift
import UIKit
import Sidebox

class ViewController: SBViewController {
	...
}
```

And developer should set SBView (User can controll by drag gesture) as below:
```swift
let view = SBView(frame: CGRectMake(x, y, width, height))
view.delegate = self
view.setIcon(UIImage)
view.setDict([String: AnyObject])
self.view.addSubview(view)
```

Delegate methods are as below:
```swift
// called when SBView is user hold
override func editModeStart(view: SBView) {
	...
}

// called when SBView is user release
override func editModeEnd(view: SBView) {
	...
}

// called when SBIconView in sidebox is tapped
override func iconTapped(data: SBDataObject) {
	...
}
```

## Author

Takeshi Ihara, t_ihara@waku-2.com  
Keisuke Toyoshima, k_toyoshima@waku-2.com

##License

    Copyright 2015 RECRUIT LIFESTYLE CO., LTD.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


  
