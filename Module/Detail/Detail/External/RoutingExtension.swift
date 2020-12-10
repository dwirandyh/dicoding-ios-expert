//
//  RoutingExtension.swift
//  Detail
//
//  Created by Dwi Randy Herdinanto on 10/12/20.
//

import Foundation
import Routing
import Resolver
import SwiftUI

public extension Routing {
    func registerDetailRouting() {
        self.routeToDetail = { restaurantId in
            AnyView(DetailView(viewModel: Resolver.resolve(), restaurantId: restaurantId))
        }
    }
}
