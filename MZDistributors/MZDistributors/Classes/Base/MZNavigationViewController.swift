//
//  MZNavigationViewController.swift
//  MZDistributors
//
//  Created by Alex William on 2018/8/16.
//  Copyright © 2018年 MoziTechnology. All rights reserved.
//

import UIKit

class MZNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.barTintColor = UIColor(hex: "#00BAD0")
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                             NSAttributedStringKey.font: UIFont(name: "PingFang-SC-Regular", size: 18) ?? ""]
        navigationBar.tintColor = UIColor.white
        // 添加全局手势
        setupGesture()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            let returnImage = UIImage(named: "icon_arrow_white_left")?.withRenderingMode(.alwaysOriginal)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: returnImage, style: .plain, target: self, action: #selector(backButtonTapClick))
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    // back
    @objc func backButtonTapClick() {
        
        self.popViewController(animated: true)
    }
}

extension MZNavigationViewController: UIGestureRecognizerDelegate {
    
    // 添加全局手势
    fileprivate func setupGesture() {
        
        let target = self.interactivePopGestureRecognizer?.delegate
        let pan = UIPanGestureRecognizer(target:target, action:Selector(("handleNavigationTransition:")))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
        
        // 禁用掉系统自带的手势返回
        self.interactivePopGestureRecognizer?.isEnabled = false
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
//        for viewController: UIViewController in self.childViewControllers {
        
//            if viewController .isKind(of: MZUserInforViewController.self) {
//
//                return false
//            }
            
//        }
        
        return self.childViewControllers.count > 1
    }
}
