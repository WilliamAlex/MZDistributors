//
//  MZAddNewAddressViewController.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/20.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

class MZAddNewAddressViewController: MZBaseViewController {

    // 地址View
    var addressView: MZAddNewAddressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBaseicInfos()
    }
}

extension MZAddNewAddressViewController {
    
    // 配置基础信息
    fileprivate func setupBaseicInfos() {
        
        self.title = "收货地址"
        self.view.backgroundColor = UIColor(hex: "#F8F8F8")
        
        self.addressView = MZAddNewAddressView(frame: CGRect(x: 0, y: MZNAVH, width: MZSCREENW, height: 245))
        self.view.addSubview(addressView)
    }
}
