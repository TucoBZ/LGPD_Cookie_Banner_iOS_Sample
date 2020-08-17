//
//  Localizable.swift
//  LGPDBannerSample
//
//  Created by Tulio Bazan on 27/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import Foundation

public protocol Localizable {
    var localized: String { get }
    var localizationKey: String { get }
    var tableName: String { get }
    var bundle: Bundle { get }
}


public extension Localizable {
    var localized: String {
        return NSLocalizedString(localizationKey,
                                 tableName: tableName,
                                 bundle: bundle,
                                 value: "",
                                 comment: "")
    }

    var bundle: Bundle {
        return Bundle.main
    }
}
