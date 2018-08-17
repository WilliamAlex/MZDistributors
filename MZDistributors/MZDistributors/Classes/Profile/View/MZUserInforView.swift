//
//  MZUserInforView.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/17.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

class MZUserInforView: UIView {

    // MARK: 属性区
    /// 背景图片
    var bgImageV: UIImageView?
    
    /// 头像
    var headImageV: UIImageView?
    
    /// 昵称
    var nickLb: UILabel?

    /// 等级图标
    var levelBtn: UIButton?
    
    /// 背景图片链接
    var imageStr: String?
    
    // MARK: 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
         setUpUserInfoView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MZUserInforView {
    
    fileprivate func setUpUserInfoView() {
        
        /// 背景
        bgImageV = UIImageView(frame: self.bounds)

        
    }
}








































