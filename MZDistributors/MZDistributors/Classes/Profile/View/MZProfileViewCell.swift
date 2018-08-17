//
//  MZProfileViewCell.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/17.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

class MZProfileViewCell: UITableViewCell {
    
    /// 图标
    var iconV: UIImageView?
    
    /// 类名
    var categateLb: UILabel?
    
    // 提示标签
    var promotLb: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setUpProfileCellStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MZProfileViewCell {
    
    fileprivate func setUpProfileCellStyle() {
        
        // 箭头
        let arrowV = UIImageView.init(image: UIImage(named: "icon_arrow_hui_right"))
        contentView.addSubview(arrowV)
        arrowV.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(contentView.snp.centerY)
            make.right.equalTo(contentView.snp.right).offset(-16)
        }
        
        // 图标
        iconV = UIImageView.init(image: UIImage(named: "my_icon_recom"))
        self.contentView.addSubview(iconV!)
        iconV?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.left.equalTo(self.contentView.snp.left).offset(16)
        })
        
        // 类别
        categateLb = UILabel.init(.zero, textColor: "#333333", font: 14, aligment: .left, text: "我的推荐")
        self.contentView.addSubview(categateLb!)
        categateLb?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(iconV!.snp.centerY)
            make.left.equalTo(iconV!.snp.right).offset(10)
        })
        
        // 提示标签
        promotLb = UILabel.init(.zero, textColor: "#F1393A", font: 12, aligment: .right, text: "未提交")
        self.contentView.addSubview(promotLb!)
        promotLb?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(categateLb!.snp.centerY)
            make.right.equalTo(arrowV.snp.left).offset(-10)
        })
        
        // 分割线
        let sepView = UIView()
        sepView.backgroundColor = UIColor(hex: "#D7D7D7")
        contentView.addSubview(sepView)
        sepView.snp.makeConstraints({ (make) in
            
            make.bottom.equalTo(contentView.snp.bottom)
            make.right.left.equalTo(contentView)
            make.height.equalTo(0.5)
        })
    }
}
