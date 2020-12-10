//
//  CommonDI.swift
//  Common
//
//  Created by Dwi Randy Herdinanto on 10/12/20.
//

import Foundation
import RealmSwift
import Resolver

extension Resolver {
    public static func registerCoreServices() {
        register {
            RemoteDataSourceImpl() as RemoteDataSource
        }

        do {
            try Realm()
        } catch let error {
            print(error)
        }

        register {
            LocaleDataSourceImpl(realm: try? Realm()) as LocaleDataSource
        }

        register {
            RestaurantRepositoryImpl(localeDataSource: resolve(), remoteDataSource: resolve()) as RestaurantRepository
        }
    }
}
