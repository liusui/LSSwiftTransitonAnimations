//
//  PushViewController.swift
//  LSSwiftTransitonAnimations
//
//  Created by Liusui on 2017/4/11.
//  Copyright © 2017年 liusui. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
    var navigationTitle: String = ""
    var selectCell: LSCollectionCell!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "push" {
            let toVC = segue.destination as! ToViewController
            toVC.image = self.selectCell.imageView.image
        }
    }
}

extension PushViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! LSCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectCell = collectionView.cellForItem(at: indexPath) as! LSCollectionCell
        self.performSegue(withIdentifier: "push", sender: nil)
    }
}

extension PushViewController: UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push {
            return LSTransition()
        }
        return nil
    }
}
