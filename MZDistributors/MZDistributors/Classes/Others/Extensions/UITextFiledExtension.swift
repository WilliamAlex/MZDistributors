//
//  UITextFiledExtension.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/20.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    convenience init(frame: CGRect, textColor: String, textFont: CGFloat, placeholderColor: String, placeholder: String) {
        self.init()
        
        self.textColor = UIColor(hex: textColor)
        self.font = UIFont(name: "PingFang-SC-Regular", size: textFont)
        self.placeholder = placeholder
        self.setValue(NSNumber(value: 10), forKey: "paddingLeft")   // 向左偏移
        self.tintColor = UIColor(hex: "#00BAD0")
        //字体大小
        self.setValue(UIFont.systemFont(ofSize: textFont), forKeyPath: "_placeholderLabel.font")
        
        //字体颜色
        self.setValue(UIColor(hex: placeholderColor), forKeyPath: "_placeholderLabel.textColor")
    }
}

