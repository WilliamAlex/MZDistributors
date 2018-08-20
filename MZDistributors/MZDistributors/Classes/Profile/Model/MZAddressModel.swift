//
//  MZAddressModel.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/20.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

class MZAddressModel: NSObject {

    // 用户名
    var userName: String = ""
    
    // 电话号码
    var phone: String = ""
    
    // 地址
    var address: String = ""
    
    // 是否显示默认地址图标
    var isShowDefault: Bool = false
    
    // 自适应高度
    func cellHeight() -> CGFloat {
        
        let nameY: CGFloat = 22
        let margin: CGFloat = 15
        var cellH: CGFloat = 0.0
        let userNameH = self.userName.boundingRect(with: CGSize(width: 100, height: 0), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "PingFang-SC-Regular", size: 14) ?? ""], context: nil).height
        let contentH = self.address.boundingRect(with: CGSize(width: 200, height: 0), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "PingFang-SC-Regular", size: 12) ?? ""], context: nil).height
        cellH = nameY + userNameH + contentH + 2*margin
        return cellH
    }
}
