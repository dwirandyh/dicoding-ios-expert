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

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerCoreServices()
        registerHomeServices()
        registerDetailService()
        registerFavoriteService()
    }
}
