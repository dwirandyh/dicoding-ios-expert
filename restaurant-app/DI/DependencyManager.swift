//
//  DependencyManager.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation
import RealmSwift
import Resolver
import Common
import Detail
import Home
import Favorite

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerCoreServices()
        registerHomeServices()
        registerDetailService()
        registerFavoriteService()
    }
}
