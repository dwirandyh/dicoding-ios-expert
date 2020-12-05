//
//  DependencyManager.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation
import RealmSwift
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerCoreServices()
        registerHomeServices()
        registerDetailService()
        registerFavoriteService()
    }

    public static func registerCoreServices() {
        register {
            RemoteDataSourceImpl() as RemoteDataSource
        }

        register {
            LocaleDataSourceImpl(realm: try? Realm()) as LocaleDataSource
        }

        register {
            RestaurantRepositoryImpl(localeDataSource: resolve(), remoteDataSource: resolve()) as RestaurantRepository
        }
    }
}
