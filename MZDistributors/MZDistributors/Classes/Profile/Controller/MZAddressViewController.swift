//
//  MZAddressViewController.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/20.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

let MZADDRESSLISTCELLID = "MZADDRESSLISTCELLID"
class MZAddressViewController: MZBaseViewController {

    // tableView
    fileprivate lazy var tableView: UITableView = {
        
        let tv = UITableView(frame: CGRect(x: 0, y: 0, width: MZSCREENW, height: MZSCREENH - 49), style: .plain)
        tv.backgroundColor = UIColor(hex: "#F8F8F8")
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        tv.rowHeight = 50
        tv.separatorStyle = .none
        tv.delegate = self
        tv.dataSource = self
        tv.register(MZAddressTableViewCell.self, forCellReuseIdentifier: MZADDRESSLISTCELLID)
        return tv
    }()
    
    var model: MZAddressModel?

    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupBaseInfos()
        self.model = MZAddressModel()
        self.model!.userName = "白皮猪"
        self.model!.phone = "15367895456"
        self.model!.address = "广东省深圳市福田区庙创新省深圳市福田区车公庙创新广东省深圳市福田区庙创新省深圳市福田区车公庙创新广东省深圳市福田区庙创新省深圳市福田区车公庙创新"
        self.model!.isShowDefault = true
    }
}

extension MZAddressViewController {
    
    // 基础配置
    fileprivate func setupBaseInfos() {
        
        self.title = "收货地址"
        self.view.backgroundColor = UIColor(hex: "#F8F8F8")
        let rightBtn = UIButton.init(CGRect(x: 0, y: 0, width: 80, height: 30), title: "管理地址", textColor: "#FFFFFF", font: 14, target: self, action: #selector(managerAddress))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        self.view.addSubview(self.tableView)
        
        // 新增按钮
        let addAddressBtn = UIButton(.zero, title: "新增收货地址", textColor: "#FEFEFE", font: 14, target: self, action: #selector(addNewAddress))
        addAddressBtn.backgroundColor = UIColor(hex: "#00BAD0")
        addAddressBtn.titleLabel?.textAlignment = .center
        self.view.addSubview(addAddressBtn);
        addAddressBtn.snp.makeConstraints { (make) in
            
            make.left.bottom.right.equalTo(self.view)
            make.height.equalTo(49)
        }
    }
    
    // event
    @objc func managerAddress() {
        
        
    }
    
    @objc func addNewAddress() {
        
        let addNewVc = MZAddNewAddressViewController()
        self.navigationController?.pushViewController(addNewVc, animated: true)
    }
}


extension MZAddressViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MZADDRESSLISTCELLID) as! MZAddressTableViewCell
        cell.model = self.model!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.model!.cellHeight()
    }
}























