//
//  FavoriteUseCase.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 05/12/20.
//

import Foundation
import Combine
import Common

protocol FavoriteUseCase {
    func getFavorite() -> AnyPublisher<[RestaurantModel], Error>
}

class FavoriteUseCaseImpl: FavoriteUseCase {

    private let repository: RestaurantRepository

    init(repository: RestaurantRepository) {
        self.repository = repository
    }

    func getFavorite() -> AnyPublisher<[RestaurantModel], Error> {
        return self.repository.getFavorite()
    }
}
