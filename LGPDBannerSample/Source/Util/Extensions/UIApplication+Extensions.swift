//
//  UIApplication+Extensions.swift
//  LGPDBannerSample
//
//  Created by Tulio Bazan on 27/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

extension UIApplication {

    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }

        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }

        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }

        return base
    }

}
