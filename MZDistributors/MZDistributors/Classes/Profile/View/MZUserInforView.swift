//
//  MZUserInforView.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/17.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

// 协议
protocol UserInfoViewDelegate: NSObjectProtocol {
    
    // 点击查看个人资料
    func checkOutUserInformations()
}

class MZUserInforView: UIView {

    // MARK: 属性区
    // 代理协议
    weak var delegate: UserInfoViewDelegate?
    
    /// 背景图片
    var bgImageV: UIImageView?
    
    /// 头像
    var headImageV: UIImageView?
    
    /// 昵称
    var nickLb: UILabel?

    /// 等级图标
    var levelBtn: UIButton?
    
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
        bgImageV = UIImageView.init(frame: self.bounds)
        bgImageV?.image = UIImage(named: "my_bg_head")
        bgImageV?.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(checkUserInfos))
        bgImageV?.addGestureRecognizer(tap)
        self.insertSubview(bgImageV!, at: 0)
        
        /// 头像
        headImageV = UIImageView(image: UIImage.init(named: "icon_head"))
        bgImageV?.addSubview(headImageV!)
        headImageV?.snp.makeConstraints({ (make) in
            
            make.centerX.equalTo(bgImageV!.snp.centerX)
            make.size.equalTo(CGSize(width: 75, height: 75))
            make.centerY.equalTo(bgImageV!.snp.centerY).offset(-15)
        })
        
        /// 昵称
        nickLb = UILabel.init(.zero, textColor: "#FFFFFF", font: 15, aligment: .center, text: "墨子传奇")
        bgImageV?.addSubview(nickLb!)
        nickLb?.snp.makeConstraints({ (make) in
            
            make.centerX.equalTo(headImageV!.snp.centerX)
            make.top.equalTo(headImageV!.snp.bottom)
        })
        
        // 等级
        levelBtn = UIButton(.zero, img: "my_icon_level3", title: "特约经销商", textColor: "#FFAD2B", font: 10, target: self, action: #selector(noAction))
        levelBtn?.backgroundColor = UIColor.white
        levelBtn?.setTitleColor(UIColor(hex: "#FFAD2B"), for: .normal)
        levelBtn?.layer.cornerRadius = 8
        levelBtn?.layer.masksToBounds = true
        levelBtn?.contentEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 8)
        levelBtn?.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0)
        levelBtn?.sizeToFit()
        bgImageV?.addSubview(levelBtn!)
        levelBtn?.snp.makeConstraints({ (make) in
            
            make.centerX.equalTo(nickLb!.snp.centerX)
            make.top.equalTo(nickLb!.snp.bottom).offset(5)
            make.height.equalTo(16)
        })
    }
    
    
    /// event
    @objc func noAction() {}
    
    // 查看用户资料
    @objc func checkUserInfos() {
        
        self.delegate?.checkOutUserInformations()
    }
}






























