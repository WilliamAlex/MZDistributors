//
//  MZUserInforViewController.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/17.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

let MZUSERINFOCELLID = "MZUSERINFOCELLID"
class MZUserInforViewController: MZBaseViewController {

    // MARK: lazy
    fileprivate lazy var tableView: UITableView = {
        
        let tv = UITableView(frame: CGRect(x: 0, y: 0, width: MZSCREENW, height: MZSCREENH), style: .plain)
        tv.backgroundColor = UIColor(hex: "#F8F8F8")
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = 50
        tv.tableFooterView = UIView()
        tv.separatorStyle = .none
        tv.backgroundColor = UIColor(hex: "#F8F8F8")
        return tv
    }()
    
    fileprivate var titleArr: [String] = ["手 机 号:", "真实姓名:", "用户身份:", "保 荐 人:"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "个人资料"
        self.view.addSubview(tableView)
        tableView.register(MZUserInfoViewCell.self, forCellReuseIdentifier: MZUSERINFOCELLID)
    }

}

// delegate&datasource
extension MZUserInforViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MZUSERINFOCELLID) as! MZUserInfoViewCell
        cell.titleLb?.text = titleArr[indexPath.row]
        return cell
    }
}
