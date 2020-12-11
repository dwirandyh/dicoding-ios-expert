//
//  Routing.swift
//  Routing
//
//  Created by Dwi Randy Herdinanto on 10/12/20.
//

import Foundation
import SwiftUI

public class Routing {

    public static var shared = Routing()

    public var routeToDetail: ((_ restaurantId: String) -> AnyView)?

    public func navigateToDetail(restaurantId: String) -> AnyView? {
        return self.routeToDetail?(restaurantId)
    }

    public var routeToFavorite: (() -> AnyView)?

    public func navigateToFavorite() -> AnyView? {
        return self.routeToFavorite?()
    }

    public var routeToHome: (() -> AnyView)?

    public func navigateToHome() -> AnyView? {
        return self.routeToHome?()
    }
}
