//
//  LSColor.swift
//  LSSwiftTransitonAnimations
//
//  Created by Liusui on 2017/4/12.
//  Copyright © 2017年 liusui. All rights reserved.
//

import UIKit

extension UIColor {
    static func navigationBarBackgroundColor() -> UIColor {
        return generateColor(232.0, green: 198.0, blue: 180.0, alpha: 1)
    }
    
    static func navigationBarTintColor() -> UIColor {
        return generateColor(171.0, green: 80.0, blue: 189.0, alpha: 1)
    }
    
    static func textColor() -> UIColor {
        return generateColor(88, green: 35, blue: 92, alpha: 1)
    }
    
    static func generateColor(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
