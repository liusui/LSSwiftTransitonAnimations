//
//  LSTransition.swift
//  LSSwiftTransitonAnimations
//
//  Created by Liusui on 2017/4/11.
//  Copyright © 2017年 liusui. All rights reserved.
//

import UIKit

class LSTransition: NSObject,UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //1.获取动画的源控制器和目标控制器
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! PushViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ToViewController
        let container = transitionContext.containerView
        //2.创建一个 Cell 中 imageView 的截图，并把 imageView 隐藏，造成使用户以为移动的就是 imageView 的假象
        let snapshotView = fromVC.selectCell.imageView.snapshotView(afterScreenUpdates: false)
        snapshotView?.frame = container.convert(fromVC.selectCell.imageView.frame, from: fromVC.selectCell)
        fromVC.selectCell.imageView.isHidden = true
        //3.设置目标控制器的位置，并把透明度设为0，在后面的动画中慢慢显示出来变为1
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.view.alpha = 0
        //4.都添加到 container 中。注意顺序不能错了
        container.addSubview(toVC.view)
        container.addSubview(snapshotView!)
        //5.执行动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: { () -> Void in
            snapshotView?.frame = toVC.avatarImageView.frame
            toVC.view.alpha = 1
        }) { (finish: Bool) -> Void in
            fromVC.selectCell.imageView.isHidden = false
            toVC.avatarImageView.image = toVC.image
            snapshotView?.removeFromSuperview()
            //一定要记得动画完成后执行此方法，让系统管理 navigation
            transitionContext.completeTransition(true)
        }
    }
}
