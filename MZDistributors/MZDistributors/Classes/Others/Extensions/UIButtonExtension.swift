//
//  UIButtonExtension.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/17.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(_ frame: CGRect, img: String?, title: String?, textColor: String, font: CGFloat, target: Any?, action: Selector?) {
        self.init()
        
        self.titleLabel?.font = UIFont(name: "PingFang-SC-Regular", size: font)
        self.titleLabel?.textColor = UIColor(hex: textColor)
        self.setImage(UIImage(named: img!), for: .normal)
        self.setTitle(title, for: .normal)
        self.addTarget(target, action: action!, for: .touchUpInside)
        self.sizeToFit()
    }
    
    convenience init(_ frame: CGRect, bgImg: String?, title: String?, textColor: String, font: CGFloat, target: Any?, action: Selector?) {
        self.init()
        
        self.titleLabel?.font = UIFont(name: "PingFang-SC-Regular", size: font)
        self.titleLabel?.textColor = UIColor(hex: textColor)
        self.setBackgroundImage(UIImage(named: bgImg!), for: .normal)
        self.setTitle(title, for: .normal)
        self.addTarget(target, action: action!, for: .touchUpInside)
        self.sizeToFit()
    }
    
    convenience init(_ frame: CGRect, title: String?, textColor: String, font: CGFloat, target: Any?, action: Selector?) {
        self.init()
        
        self.titleLabel?.font = UIFont(name: "PingFang-SC-Regular", size: font)
        self.titleLabel?.textColor = UIColor(hex: textColor)
        self.setTitle(title, for: .normal)
        self.addTarget(target, action: action!, for: .touchUpInside)
        self.sizeToFit()
    }
}
