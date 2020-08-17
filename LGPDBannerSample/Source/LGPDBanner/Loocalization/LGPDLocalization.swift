//
//  LGPDLocalization.swift
//  LGPDBannerSample
//
//  Created by Tulio Bazan on 27/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import Foundation

enum LGPDLocalization: String, Localizable {
    case bannerInfo = "lgpd_banner_info"
    case bannerLink = "lgpd_banner_privacy_policy_link"
    case bannerButtonTitle = "lgpd_banner_button_title"

    var localizationKey: String {
        return self.rawValue
    }

    var tableName: String {
        return "LGPDLocalizable"
    }
}
