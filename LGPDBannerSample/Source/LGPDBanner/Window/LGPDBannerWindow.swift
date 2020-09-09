//
//  LGPDBannerWindow.swift
//  LGPDBannerSample
//
//  Created by Tulio Bazan on 27/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

final class LGPDBannerWindow: UIWindow {

    override var windowLevel: UIWindow.Level {
        get {
            // needed because just setting the level on iOS 11+ to be more than the keyboard does not work for some reason
            //return UIWindow.Level(rawValue: CGFloat.greatestFiniteMagnitude - 1 )
            return .statusBar
        }
        set { }
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let result = super.hitTest(point, with: event)
        if result == self || result?.subviews.first is UntouchableView { return nil }
        return result
    }
}
