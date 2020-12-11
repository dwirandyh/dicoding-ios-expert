//
//  StringLocalization.swift
//  Common
//
//  Created by Dwi Randy Herdinanto on 11/12/20.
//

import Foundation

public extension String {
    func localized(identifier: String) -> String {
        let bundle = Bundle(identifier: identifier) ?? .main
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
}
