//
//  UITabBarViewController+BottomMargin.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 28.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit

extension UITabBarController {
    
    public func tabBarItemTitleBottomOffset(_ offset: Int) {
        
        for item in self.tabBar.items! {
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: CGFloat(offset * -1))
        }
    }
}
