//
//  UIColorExtension.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/16.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

// 在Extension中给系统扩展构造函数只能是便利构造函数
extension UIColor {
    
    // RGB
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    // 随机颜色
    class func randomColor() -> UIColor {
        
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
    // 十六进制
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        
        // 判断字符串长度是否符合规范
        guard hex.count >= 6 else {
            
            return nil
        }
        
        // 将字符串转为大写
        var tempHex = hex.uppercased()
        
        // 判断是什么开头
        if tempHex.hasPrefix("0x") || tempHex.hasPrefix("##") {
            
            tempHex = (tempHex as NSString).substring(from: 2)
        }
        
        if tempHex.hasPrefix("#") {
            
            tempHex = (tempHex as NSString).substring(from: 1)
        }
        
        // 分别取出RGB
        var range = NSRange(location: 0, length: 2)
        let rHex = (tempHex as NSString).substring(with: range)
        range.location = 2
        let gHex = (tempHex as NSString).substring(with: range)
        range.location = 4
        let bHex = (tempHex as NSString).substring(with: range)
        
        // 将十六进制转成数字
        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        
        self.init(r : CGFloat(r), g : CGFloat(g), b : CGFloat(b))
    }
}
