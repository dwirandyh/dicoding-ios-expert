//
//  RoutingExtension.swift
//  Favorite
//
//  Created by Dwi Randy Herdinanto on 10/12/20.
//

import Foundation
import Routing
import Resolver
import SwiftUI

public extension Routing {
    func registerFavoriteRouting() {
        self.routeToFavorite = {
            AnyView(FavoriteView(viewModel: Resolver.resolve()))
        }
    }
}
