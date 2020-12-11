//
//  RoutingExtension.swift
//  Home
//
//  Created by Dwi Randy Herdinanto on 10/12/20.
//

import Foundation
import Routing
import Resolver
import SwiftUI

public extension Routing {
    func registerHomeRouting() {
        self.routeToHome = {
            AnyView(HomeView(viewModel: Resolver.resolve()))
        }
    }
}
