//
//  LGPDBannerContainerController.swift
//  LGPDBannerSample
//
//  Created by Tulio Bazan on 27/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

struct LGPDBannerConstants {

    struct Banner {
        static let bottomOffset: CGFloat = -57
        static let trailingOffset: CGFloat = -16
        static let leadingOffset: CGFloat = 16
    }

}

protocol LGPDBannerContainerControllerDelegate: class {
    func didTapPrivacyPolicyLink()
    func didConfirmLGPDBanner()
}

final class LGPDBannerContainerController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        let appTopViewController = UIApplication.topViewController()
        return appTopViewController?.supportedInterfaceOrientations ?? super.supportedInterfaceOrientations
    }

    override var prefersHomeIndicatorAutoHidden: Bool {
        let appTopViewController = UIApplication.topViewController()
        return appTopViewController?.prefersHomeIndicatorAutoHidden ?? super.prefersHomeIndicatorAutoHidden
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        let appTopViewController = UIApplication.topViewController()
        return appTopViewController?.preferredStatusBarStyle ?? super.preferredStatusBarStyle
    }

    lazy var banner: LGPDBannerView = {
        let banner = LGPDBannerView()
        banner.translatesAutoresizingMaskIntoConstraints = false
        return banner
    }()

    weak var delegate: LGPDBannerContainerControllerDelegate?

    override func loadView() {
        super.loadView()

        let untouchbaleView = UntouchableView()
        view = untouchbaleView

        view.backgroundColor = .clear
        setupBannerView()
    }


    private func setupBannerView() {
        view.addSubview(banner)

        NSLayoutConstraint.activate([
            banner.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                           constant: LGPDBannerConstants.Banner.bottomOffset),
            banner.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                             constant: LGPDBannerConstants.Banner.trailingOffset),
            banner.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                            constant: LGPDBannerConstants.Banner.leadingOffset)
        ])

        banner.delegate = self
    }
}

extension LGPDBannerContainerController: LGPDBannerViewDelegate {

    func didTapPrivacyPolicyLink() {
        delegate?.didTapPrivacyPolicyLink()
    }

    func didConfirmLGPDBanner() {
        delegate?.didConfirmLGPDBanner()
    }

}
