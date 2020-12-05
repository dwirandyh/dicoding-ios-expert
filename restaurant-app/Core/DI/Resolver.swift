//
//  Resolver.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation

class Resolver {
    private var storage = [String: Injectable]()

    static let shared = Resolver()

    func add<T: Injectable>(_ injectable: T) {
        let key = String(reflecting: injectable)
        storage[key] = injectable
    }

    func resolve<T: Injectable>() -> T {
        let key = String(reflecting: T.self)

        guard let injectable = storage[key] as? T else {
            fatalError("\(key) has not been added as injectable object.")
        }

        return injectable
    }
}
