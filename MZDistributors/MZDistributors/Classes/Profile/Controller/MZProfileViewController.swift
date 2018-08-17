//
//  MZProfileViewController.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/16.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit


let PROFILETABLEVIEWCELLID = "PROFILETABLEVIEWCELLID"
class MZProfileViewController: MZBaseViewController {
    
    // 用户信息View
    var userInfoView: MZUserInforView?
    
    // MARK: lazy
    fileprivate lazy var scrollView: UIScrollView = {
        
        let scr = UIScrollView(frame: CGRect(x: 0, y: 0, width: MZSCREENW, height: MZSCREENH))
        scr.backgroundColor = UIColor(hex: "#F8F8F8")
        scr.showsVerticalScrollIndicator = false
        scr.showsHorizontalScrollIndicator = false
        scr.delegate = self
        return scr
    }()
    
    fileprivate lazy var tableView: UITableView = {
        
        let tv = UITableView(frame: CGRect(x: 0, y: 0, width: MZSCREENW, height: MZSCREENH), style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = 50
//        tv.separatorStyle = .none
        tv.backgroundColor = UIColor(hex: "#F8F8F8")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(tableView)
        
        tableView.register(MZProfileViewCell.self, forCellReuseIdentifier: PROFILETABLEVIEWCELLID)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: delegate/datasource
extension MZProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PROFILETABLEVIEWCELLID, for: indexPath) as! MZProfileViewCell
        cell.textLabel?.text = "测试标签"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("您点击了第: \(indexPath.row)个cell")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 179
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        userInfoView = MZUserInforView()
        return userInfoView
    }
    
    
    
}

// MARK: UIScrollViewDelegate
extension MZProfileViewController: UIScrollViewDelegate {
    
    
}





















