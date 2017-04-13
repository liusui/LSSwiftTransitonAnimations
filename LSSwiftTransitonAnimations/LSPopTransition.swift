//
//  LSPopTransition.swift
//  LSSwiftTransitonAnimations
//
//  Created by Liusui on 2017/4/13.
//  Copyright © 2017年 liusui. All rights reserved.
//

import UIKit

class LSPoptransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ToViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! PushViewController
        let container = transitionContext.containerView
        
        let snapshotView = fromVC.avatarImageView.snapshotView(afterScreenUpdates: false)
        snapshotView?.frame = container.convert(fromVC.avatarImageView.frame, from: fromVC.view)
        fromVC.avatarImageView.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.selectCell.imageView.isHidden = true
        
        container.insertSubview(toVC.view, belowSubview: fromVC.view)
        container.addSubview(snapshotView!)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: { () -> Void in
            snapshotView?.frame = container.convert(toVC.selectCell.imageView.frame, from: toVC.selectCell)
            fromVC.view.alpha = 0
        }) { (finish: Bool) -> Void in
            toVC.selectCell.imageView.isHidden = false
            snapshotView?.removeFromSuperview()
            fromVC.avatarImageView.isHidden = false
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
