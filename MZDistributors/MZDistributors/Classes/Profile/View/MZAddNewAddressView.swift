//
//  MZAddNewAddressView.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/20.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

class MZAddNewAddressView: UIView {
    
    // 选择地址
    var locationBtn: UIButton?
    
    // 详细地址
    
    // 收货人
    var receiverTf: UITextField?
    
    // 联系电话
    var phoneTf: UITextField?
    
    // 默认地址
    var defaultBtn: UIButton?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
     
        // 占位view
        let placeholderView = UIView(frame: CGRect(x: 0, y: 0, width: MZSCREENW, height: 245))
        placeholderView.backgroundColor = UIColor.white
        self.addSubview(placeholderView)
        
        // 分割线
        let line1 = UIView()
        line1.backgroundColor = UIColor(hex: "#D7D7D7")
        placeholderView.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(placeholderView)
            make.height.equalTo((0.5))
            make.top.equalTo(placeholderView.snp.top).offset(49)
        }
        
        // 所在地
        let areaLb = UILabel.init(.zero, textColor: "#666666", font: 14, aligment: .left, text: "所在地区：")
//        areaLb.backgroundColor = UIColor.red
        placeholderView.addSubview(areaLb)
        areaLb.snp.makeConstraints { (make) in
            
            make.left.equalTo(placeholderView.snp.left).offset(20)
            make.top.equalTo(placeholderView.snp.top)
            make.bottom.equalTo(line1.snp.top)
        }
        
        self.locationBtn = UIButton(.zero, img: "icon_arrow_hui_right", title: "请选择所在地区", textColor: "#999999", font: 14, target: self, action: #selector(chooseLocations))
//        self.locationBtn?.backgroundColor = UIColor .green
        self.locationBtn?.titleEdgeInsets = UIEdgeInsetsMake(0, -170, 0, 20)
        self.locationBtn?.imageEdgeInsets = UIEdgeInsetsMake(0, 250, 0, 20)
        self.addSubview(self.locationBtn!)
        self.locationBtn?.snp.makeConstraints({ (make) in
            
            make.top.bottom.equalTo(areaLb)
            make.left.equalTo(areaLb.snp.right).offset(5)
            make.right.equalTo(placeholderView.snp.right)
        })
        
        // 分割线2
        let line2 = UIView()
        line2.backgroundColor = UIColor(hex: "#D7D7D7")
        placeholderView.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(placeholderView)
            make.height.equalTo((0.5))
            make.top.equalTo(line1.snp.bottom).offset(49)
        }
        
        // 详细地址
        let detialLb = UILabel.init(.zero, textColor: "#666666", font: 14, aligment: .left, text: "详细地址：")
//                detialLb.backgroundColor = UIColor.red
        placeholderView.addSubview(detialLb)
        detialLb.snp.makeConstraints { (make) in
            
            make.left.equalTo(areaLb.snp.left)
            make.top.equalTo(line1.snp.bottom)
            make.bottom.equalTo(line2.snp.top)
        }
        
        // 分割线3
        let line3 = UIView()
        line3.backgroundColor = UIColor(hex: "#D7D7D7")
        placeholderView.addSubview(line3)
        line3.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(placeholderView)
            make.height.equalTo((0.5))
            make.top.equalTo(line2.snp.bottom).offset(49)
        }
        
        // 收货人
        let receiverLb = UILabel.init(.zero, textColor: "#666666", font: 14, aligment: .left, text: "收 货 人：")
//        receiverLb.backgroundColor = UIColor.red
        placeholderView.addSubview(receiverLb)
        receiverLb.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(areaLb)
            make.top.equalTo(line2.snp.bottom)
            make.bottom.equalTo(line3.snp.top)
            
        }
        
        receiverTf = UITextField.init(frame: .zero, textColor: "#333333", textFont: 14, placeholderColor: "#999999", placeholder: "请填写收货人")
//        receiverTf?.backgroundColor = UIColor.green
        placeholderView.addSubview(receiverTf!)
        receiverTf?.snp.makeConstraints({ (make) in
            
            make.top.bottom.equalTo(receiverLb)
            make.left.equalTo(receiverLb.snp.right).offset(5)
            make.right.equalTo(placeholderView.snp.right)
        })
        
        let line4 = UIView()
        line4.backgroundColor = UIColor(hex: "#D7D7D7")
        placeholderView.addSubview(line4)
        line4.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(placeholderView)
            make.height.equalTo((0.5))
            make.top.equalTo(line3.snp.bottom).offset(49)
        }
        
        // 联系电话
        let connectLb = UILabel.init(.zero, textColor: "#666666", font: 14, aligment: .left, text: "联系电话：")
//                connectLb.backgroundColor = UIColor.red
        placeholderView.addSubview(connectLb)
        connectLb.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(areaLb)
            make.top.equalTo(line3.snp.bottom)
            make.bottom.equalTo(line4.snp.top)
        }
        
        phoneTf = UITextField.init(frame: .zero, textColor: "#333333", textFont: 14, placeholderColor: "#999999", placeholder: "请填写联系电话")
//                phoneTf?.backgroundColor = UIColor.green
        phoneTf?.keyboardType = .numberPad
        placeholderView.addSubview(phoneTf!)
        phoneTf?.snp.makeConstraints({ (make) in
            
            make.top.bottom.equalTo(connectLb)
            make.left.equalTo(connectLb.snp.right).offset(5)
            make.right.equalTo(placeholderView.snp.right)
        })
        
        defaultBtn = UIButton.init(.zero, img: "add_icon_def", title: "设置默认地址", textColor: "##333333", font: 14, target: self, action: #selector(setCurrentaddressDefault(button:)))
        defaultBtn?.setImage(UIImage(named: "add_icon_sel"), for: .selected)
        defaultBtn?.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5)
        defaultBtn?.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0)
//        defaultBtn?.backgroundColor = UIColor.red
        placeholderView.addSubview(defaultBtn!)
        defaultBtn?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(areaLb.snp.left)
            make.top.equalTo(line4.snp.bottom)
            make.bottom.equalTo(placeholderView.snp.bottom)
            make.width.equalTo(130)
        })
        
        // 保存按钮
        let saveBtn = UIButton(.zero, title: "保存", textColor: "#FFFFFF", font: 14, target: self, action: #selector(saveCurrentAddress))
        saveBtn.backgroundColor = UIColor(hex: "#00BAD0")
        saveBtn.layer.cornerRadius = 3
        saveBtn.layer.masksToBounds = true
        self.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.snp.left).offset(43)
            make.right.equalTo(self.snp.right).offset(-43)
            make.top.equalTo(placeholderView.snp.bottom).offset(86)
            make.height.equalTo(44)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MZAddNewAddressView {
    
    // event
    @objc func chooseLocations() {
        
        print("请选择地址")
    }
    
    @objc func setCurrentaddressDefault(button: UIButton) {
        
        button.isSelected = !button.isSelected
        print("设置为默认地址")
    }
    
    @objc func saveCurrentAddress() {
        
        print("保存地址")
    }
    
    
    
    
}
