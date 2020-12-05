//
//  Injectable.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation

protocol Injectable {}

@propertyWrapper
struct Inject<T: Injectable> {
    let wrappedValue: T

    init() {
        wrappedValue = Resolver.shared.resolve()
    }
}
