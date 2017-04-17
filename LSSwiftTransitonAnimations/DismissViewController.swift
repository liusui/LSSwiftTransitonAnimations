//
//  DismissViewController.swift
//  LSSwiftTransitonAnimations
//
//  Created by Liusui on 2017/4/14.
//  Copyright © 2017年 liusui. All rights reserved.
//

import UIKit

class DismissViewController: UIViewController,UIViewControllerTransitioningDelegate {
    fileprivate var percentDrivenTransition: UIPercentDrivenInteractiveTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self
        //手势监听器
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgePanGesture(edgePan:)))
        edgePan.edges = UIRectEdge.right
        self.view.addGestureRecognizer(edgePan)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissAction(_ sender: Any) {
         self.dismiss(animated: true) { 
            
        }
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondVC = segue.destination as! DismissViewController
        secondVC.transitioningDelegate = self
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgePanGesture(edgePan:)))
        edgePan.edges = UIRectEdge.left
        self.view.addGestureRecognizer(edgePan)
        
        super.prepare(for: segue, sender: sender)
    }
    
    func edgePanGesture(edgePan: UIScreenEdgePanGestureRecognizer) {
        let progress = abs(edgePan.translation(in: UIApplication.shared.keyWindow!).x) / UIApplication.shared.keyWindow!.bounds.width
        
        if edgePan.state == UIGestureRecognizerState.began {
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            if edgePan.edges == UIRectEdge.right {
                self.performSegue(withIdentifier: "present", sender: nil)
            } else if edgePan.edges == UIRectEdge.left {
                self.dismiss(animated: true, completion: nil)
            }
        } else if edgePan.state == UIGestureRecognizerState.changed {
            self.percentDrivenTransition?.update(progress)
        } else if edgePan.state == UIGestureRecognizerState.cancelled || edgePan.state == UIGestureRecognizerState.ended {
            if progress > 0.5 {
                self.percentDrivenTransition?.finish()
            } else {
                self.percentDrivenTransition?.cancel()
            }
            self.percentDrivenTransition = nil
        }
    }
    
    @IBAction func presentAction(_ sender: Any) {
        self.performSegue(withIdentifier: "present", sender: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LSPresentTransition()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LSDismissTransition()
    }
    
    //百分比Push
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.percentDrivenTransition
    }
    //百分比Pop
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.percentDrivenTransition
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
