//
//  DetailUseCase.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation
import Combine
import Common

protocol DetailUseCase {
    func getRestaurantDetail(restaurantId: String) -> AnyPublisher<RestaurantDetailModel, Error>
//    func addFavorite(restaurant: RestaurantEntity) -> AnyPublisher<Bool, Error>
}

class DetailUseCaseImpl: DetailUseCase {

    private let repository: RestaurantRepository

    init(repository: RestaurantRepository) {
        self.repository = repository
    }

    func getRestaurantDetail(restaurantId: String) -> AnyPublisher<RestaurantDetailModel, Error> {
        return self.repository.getRestaurantDetail(restaurantId: restaurantId)
    }

//    func addFavorite(restaurant: RestaurantEntity) -> AnyPublisher<Bool, Error> {
//        return self.repository.addFavorite(restaurant: restaurant)
//    }
}
