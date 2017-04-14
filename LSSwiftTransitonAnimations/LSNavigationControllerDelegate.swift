//
//  LSNavigationControllerDelegate.swift
//  LSSwiftTransitonAnimations
//
//  Created by Liusui on 2017/4/14.
//  Copyright © 2017年 liusui. All rights reserved.
//

import UIKit

class LSNavigationControllerDelegate: NSObject,UINavigationControllerDelegate{
    override init() {
        super.init()
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push {
            return LSTransition()
        }
        return nil
    }

}
