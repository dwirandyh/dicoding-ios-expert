//
//  Router.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 10/12/20.
//

import Foundation
import Detail
import Resolver
import Routing

public extension Routing {
    func registerAllRouter() {
        self.registerDetailRouting()
    }
}
