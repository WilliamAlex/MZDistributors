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
        
        self.delegate = self

        // tabBar的背景颜色
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

// 协议
extension MZTabBarViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        self.tabBarButtonClick(tabbarButton: self.getTabBarButton())
    }
    
    fileprivate func getTabBarButton() -> UIControl {
        
        // 定义可变数组
        var tabBarButtons = [AnyHashable](repeating: 0, count: 0)
        for tabView: UIView in self.tabBar.subviews {
            
            if tabView.isKind(of: NSClassFromString("UITabBarButton")!) {

                tabBarButtons.append(tabView)
            }
        }
        
        let tabBarButton: UIControl = tabBarButtons[self.selectedIndex] as! UIControl
        return tabBarButton
    }
    
    @objc func tabBarButtonClick(tabbarButton: UIControl) {
        
        for imageView: UIView in tabbarButton.subviews {
            
            if imageView.isKind(of: NSClassFromString("UITabBarSwappableImageView")!){
                
                let animation:CAKeyframeAnimation = CAKeyframeAnimation.init()
                animation.keyPath = "transform.scale"
                animation.values = [1.0, 1.1, 0.9, 1.0]
                animation.duration = 0.3
                animation.calculationMode = kCAAnimationCubic
            
                //添加动画
                imageView.layer.add(animation, forKey: nil)
            }
        }
    }
}










