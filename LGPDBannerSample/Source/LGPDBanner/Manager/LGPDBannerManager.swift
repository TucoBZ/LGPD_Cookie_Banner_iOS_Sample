//
//  LGPDBannerManager.swift
//  LGPDBannerSample
//
//  Created by Tulio Bazan on 27/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

public class LGPDBannerManager {

    //MARK: Default Configs
    private var bannerWindow: LGPDBannerWindow?

    //MARK: Public Variables
    public static let shared: LGPDBannerManager = LGPDBannerManager()
    public var lgpdBannerView: LGPDBannerView? {
        return (bannerWindow?.rootViewController as? LGPDBannerContainerController)?.banner
    }

    public var didBuildBanner: Bool {
        return bannerWindow != nil
    }

    //MARK: initialization
    private init() {}

    public func buildBanner() {

        guard !didBuildBanner else { return }

        let keywindow = UIApplication.shared.keyWindow
        let bannerWindow = LGPDBannerWindow(frame: UIScreen.main.bounds)
        bannerWindow.tintColor = .black

        let controller = LGPDBannerContainerController()
        controller.delegate = self
        bannerWindow.rootViewController = controller

        if #available(iOS 13.0, *) {
            bannerWindow.windowScene = keywindow?.windowScene
        }

        bannerWindow.makeKeyAndVisible() // Adds the window to UIApplication windows and become key
        keywindow?.makeKeyAndVisible() // Return the keyWindow to the current keyWindow before banner window

        // save reference from banner window to avoid releasing it from windows hierarchy
        self.bannerWindow = bannerWindow
    }
}

extension LGPDBannerManager: LGPDBannerContainerControllerDelegate {
    func didTapPrivacyPolicyLink() {
        print("didTapPrivacyPolicyLink")
        if let url = URL(string: "https://policies.google.com/privacy?hl=pt-BR") {
            UIApplication.shared.open(url)
        }
    }

    func didConfirmLGPDBanner() {
        print("didConfirmLGPDBanner")
        UIView.animate(withDuration: 0.6,
                       animations: {

                        self.lgpdBannerView?.alpha = .zero

        }) { completed in
            if completed {
                if #available(iOS 13.0, *) {
                    self.bannerWindow?.windowScene = nil
                }
                self.bannerWindow = nil
            }
        }
    }
}
