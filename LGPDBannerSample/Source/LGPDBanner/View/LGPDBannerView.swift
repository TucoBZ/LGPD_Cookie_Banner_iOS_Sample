//
//  LGPDBannerView.swift
//  LGPDBannerSample
//
//  Created by Tulio Bazan on 27/07/20.
//  Copyright (c) 2020 Dextra. All rights reserved.
//

import UIKit

protocol LGPDBannerViewDelegate: class {
    func didTapPrivacyPolicyLink()
    func didConfirmLGPDBanner()
}

@IBDesignable
public class LGPDBannerView: UIView {

    @IBOutlet var textView: UITextView!
    @IBOutlet var confirmButton: UIButton!

    // Our custom view from the XIB file
    var view: UIView!
    weak var delegate: LGPDBannerViewDelegate?

    private let linkingURL: URL = URL(string: "https://www.google.com/")!

    /**
     Initialiser method
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    /**
     Initialiser method
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    /**
     Sets up the view by loading it from the xib file and setting its frame
     */
    func setupView() {
        view = loadViewFromXibFile()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        setupViewColors()
        setupViewLabels()
        setupShadow()
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13, *) {
            layer.shadowColor = UIColor.shadow?.cgColor
        }
    }

    private func setupViewColors() {
        textView.backgroundColor = .background
        //textView.textColor = .bannerText
        view.backgroundColor = .background
    }

    private func setupViewLabels() {
        textView.delegate = self
        textView.isUserInteractionEnabled = true

        let infoWithLink = String(format: LGPDLocalization.bannerInfo.localized, LGPDLocalization.bannerLink.localized)

        let attributedString = NSMutableAttributedString(string: infoWithLink)
        let linkRange = attributedString.mutableString.range(of: LGPDLocalization.bannerLink.localized)
        attributedString.addAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.bannerText
        ],range: attributedString.mutableString.range(of: infoWithLink))

        attributedString.addAttributes([
            NSAttributedString.Key.link: linkingURL
        ], range: linkRange)


        textView.attributedText = attributedString
        textView.tintColor = UIColor.systemBlue


        confirmButton.setTitle(LGPDLocalization.bannerButtonTitle.localized, for: .normal)
        confirmButton.setTitleColor(UIColor.systemBlue, for: .normal)
    }


    private func setupShadow() {
        layer.shadowColor = UIColor.shadow?.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = .zero
        layer.shadowRadius = 6

        view.layer.cornerRadius = 6
    }

    /**
     Loads a view instance from the xib file
     - returns: loaded view
     */
    func loadViewFromXibFile() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LGPDBannerView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    // MARK: Handlers

    @IBAction func didConfirmLGPD(_ sender: Any) {
        delegate?.didConfirmLGPDBanner()
    }
}

extension LGPDBannerView: UITextViewDelegate {

    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {

        if URL == linkingURL {
            delegate?.didTapPrivacyPolicyLink()
        }

        return false
    }

}
