//
//  FavoriteDI.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 05/12/20.
//

import Foundation
import Resolver

public extension Resolver {
    static func registerFavoriteService() {
        register {
            FavoriteViewModel(favoriteUseCase: resolve())
        }
        register {
            FavoriteUseCaseImpl(repository: resolve()) as FavoriteUseCase
        }
    }
}
