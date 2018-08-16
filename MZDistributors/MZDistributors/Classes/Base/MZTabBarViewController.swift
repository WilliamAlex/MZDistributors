//
//  MZTabBarViewController.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/16.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

class MZTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 去除顶部线条
        self.tabBar.barTintColor = UIColor(hex: "#FFFFFF")
        
        // 添加子控制器
        addChildViewControllers()
    }
}

extension MZTabBarViewController {
    
    // 添加子控制器
    fileprivate func addChildViewControllers() {
        
        // 首页
        setUpOneChildViewController(MZHomeViewController(), image: "my_icon_home", title: "首页")
        
        // 锁屏赚钱
        setUpOneChildViewController(MZStockViewController(), image: "my_icon_order", title: "创世城")
        
        // 我的
        setUpOneChildViewController(MZProfileViewController(), image: "my_icon_mine", title: "我的")
    }
    
    // 包装控制器
    fileprivate func setUpOneChildViewController(_ vc: UIViewController, image: String, title: String) {
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: image + "_sel")?.withRenderingMode(.alwaysOriginal)
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.fontNames(forFamilyName: "PingFang-SC-Regular")], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10)], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor(hex: "#999999") ?? UIColor.lightGray], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor(hex: "#00BAD0") ?? UIColor.darkGray], for: .selected)
        
        let nav = MZNavigationViewController(rootViewController: vc)
        addChildViewController(nav)
    }
}

