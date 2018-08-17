//
//  MZUserInfoViewCell.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/17.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

class MZUserInfoViewCell: UITableViewCell {
    
    /// 标题
    var titleLb: UILabel?
    
    /// 资料标签
    var detailTextLb: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setUpCellStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MZUserInfoViewCell {
    
    fileprivate func setUpCellStyle() {
        
        titleLb = UILabel.init(.zero, textColor: "#666666", font: 14, aligment: .left, text: "真实姓名:")
        self.contentView.addSubview(titleLb!)
        titleLb?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.left.equalTo(self.contentView.snp.left).offset(16)
        })
        
        detailTextLb = UILabel.init(.zero, textColor: "#333333", font: 14, aligment: .right, text: "15989854481")
        self.contentView.addSubview(detailTextLb!)
        detailTextLb?.snp.makeConstraints({ (make) in
            
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.centerY.equalTo(titleLb!.snp.centerY)
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
