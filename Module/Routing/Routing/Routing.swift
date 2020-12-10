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
        return routeToDetail?(restaurantId)
    }
}

//public struct Routing<Content, T> : View where Content : View, T : View {
//
//    public static var shared = Routing()
//
//    var routeToDetail: ((_ restaurantId: String) -> View)
//}
