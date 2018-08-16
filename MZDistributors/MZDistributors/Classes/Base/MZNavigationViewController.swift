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
    
        // 添加全局手势
        setupGesture()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            let returnImage = UIImage(named: "nav_return")
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
        
        let target = self.navigationController?.interactivePopGestureRecognizer!.delegate
        let pan = UIPanGestureRecognizer(target:target, action:Selector(("handleNavigationTransition:")))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
        
        // 禁用掉系统自带的手势返回
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if self.childViewControllers.count == 1 {
            
            return false
        }
        
        return true
    }
}
