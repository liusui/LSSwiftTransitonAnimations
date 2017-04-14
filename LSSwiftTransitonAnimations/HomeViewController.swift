//
//  ViewController.swift
//  LSSwiftTransitonAnimations
//
//  Created by Liusui on 2017/4/10.
//  Copyright © 2017年 liusui. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let titleArray:NSArray = ["push&pop","modal","segue"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: -
extension HomeViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row] as? String
        cell.textLabel?.font = UIFont(name: "Dosis-Light", size: 16)
        cell.textLabel?.textColor = UIColor.textColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "push&pop", sender: nil)
            break
        case 1:
            self.performSegue(withIdentifier: "modal", sender: nil)
            break
        case 2:
            self.performSegue(withIdentifier: "segue", sender: nil)
            break
            
        default: break
        }
    }
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "push&pop",let c = segue.destination as? PushViewController{
            c.navigationTitle = titleArray[0] as! String
        }
    }
}
