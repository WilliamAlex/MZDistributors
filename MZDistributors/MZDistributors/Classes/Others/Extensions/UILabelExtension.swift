//
//  UILabelExtension.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/17.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(_ frame: CGRect, textColor: String, font: Float, aligment: NSTextAlignment, text: String) {
        
        self.init()
        self.text = text
        self.textColor = UIColor(hex: textColor)
        self.textAlignment = aligment
        self.font = UIFont.init(name: "PingFang-SC-Regular", size: CGFloat(font))
        sizeToFit()
    }
}
