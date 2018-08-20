//
//  MZAddressTableViewCell.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/20.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

class MZAddressTableViewCell: UITableViewCell {
    
    /// 姓名
    var nameLb: UILabel?
    
    /// 电话
    var phoneLb: UILabel?
    
    /// 地址
    var addressLb: UILabel?
    
    /// 是否是默认地址图标
    var defaultImageV: UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.white
        self.selectionStyle = .none
        // 姓名
        nameLb = UILabel.init(.zero, textColor: "#333333", font: 14, aligment: .left, text: " ")
//        nameLb?.backgroundColor = UIColor.red
        self.contentView.addSubview(nameLb!)
        nameLb?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.top.equalTo(self.contentView.snp.top).offset(21)
        })
        
        // 电话
        phoneLb = UILabel.init(.zero, textColor: "#333333", font: 14, aligment: .left, text: " ")
        self.contentView.addSubview(phoneLb!)
        phoneLb?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(nameLb!.snp.centerY)
            make.left.equalTo(nameLb!.snp.right).offset(52)
        })
        
        // 默认图片
        defaultImageV = UIImageView.init(image: UIImage(named: "add_icon_def_yellow"))
        self.contentView.addSubview(defaultImageV!)
        defaultImageV?.snp.makeConstraints({ (make) in
            
            make.right.bottom.equalTo(self.contentView)
            make.size.equalTo(CGSize(width: 50, height: 20))
        })
        
        // 地址
        addressLb = UILabel.init(.zero, textColor: "#333333", font: 12, aligment: .left, text: " ")
//        addressLb?.backgroundColor = UIColor.green
        addressLb?.numberOfLines = 0
        self.contentView.addSubview(addressLb!)
        addressLb?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(nameLb!.snp.left)
            make.top.equalTo(nameLb!.snp.bottom).offset(10)
            make.right.equalTo(defaultImageV!.snp.left).offset(-25)
        })
    }
    
    // 模型赋值(不能卸载扩展类中)
    private var tempModel: MZAddressModel!
    var model: MZAddressModel {
        
        set{

            self.tempModel = newValue
            self.nameLb?.text = tempModel.userName
            self.phoneLb?.text = tempModel.phone
            self.addressLb?.text = tempModel.address
            if tempModel.isShowDefault == true {
                
                self.defaultImageV?.isHidden = false
            } else {
                
                self.defaultImageV?.isHidden = true
            }
        }
        get {
            
            return (self.tempModel)!
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MZAddressTableViewCell {
    
    // swift中取消了setXXX, 一般都是重写父类的方法
    override var frame: CGRect {
        
        didSet {
            var newFrame = frame
            newFrame.size.height -= 15
            super.frame = newFrame
        }
    }
}








