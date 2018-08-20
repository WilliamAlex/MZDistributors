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
        tv.tableFooterView = UIView()
        tv.separatorStyle = .none
        tv.backgroundColor = UIColor(hex: "#F8F8F8")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(tableView)
        
        tableView.register(MZProfileViewCell.self, forCellReuseIdentifier: PROFILETABLEVIEWCELLID)
        userInfoView = MZUserInforView(frame: CGRect(x: 0, y: 0, width: MZSCREENW, height: 179))
        userInfoView?.delegate = self
        tableView.tableHeaderView = userInfoView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 防止向下偏移
        self.extendedLayoutIncludesOpaqueBars = true;
        if #available(iOS 11.0, *) {
            
            self.scrollView.contentInsetAdjustmentBehavior = .never;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("您点击了第: \(indexPath.row)个cell")
        let Vc = MZAddressViewController()
        self.navigationController?.pushViewController(Vc, animated: true)
        
    }
}

// 用户协议
extension MZProfileViewController: UserInfoViewDelegate {
    
    func checkOutUserInformations() {
        
        let userinfoVc = MZUserInforViewController()
        self.navigationController?.pushViewController(userinfoVc, animated: true)
    }
}


// MARK: UIScrollViewDelegate
extension MZProfileViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // 获取tableView滚动的偏移量
        let offset_Y = scrollView.contentOffset.y
        
        // 处理图片放大
        let imageH: CGFloat = (userInfoView?.bounds.size.height)!
        let imageW: CGFloat = MZSCREENW
        
        // 下拉
        if offset_Y < 0 {
            
            let totalOffset = imageH + abs(offset_Y)
            let f = totalOffset / imageH
            
            // 如果想下拉固定头部视图不动，y和h 是要等比都设置。如不需要则y可为0
            userInfoView?.bgImageV?.frame = CGRect(x: -(imageW * f - imageW) * 0.5, y: offset_Y, width: imageW * f, height: totalOffset)
        } else {
            
            userInfoView?.bgImageV?.frame = (userInfoView?.bounds)!
        }
    }
}























