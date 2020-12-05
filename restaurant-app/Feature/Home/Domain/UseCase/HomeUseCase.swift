//
//  HomeInteractor.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation
import Combine

protocol HomeUseCase {
    func getRestaurants() -> AnyPublisher<[RestaurantModel], Error>
    func searchRestaurants(query: String) -> AnyPublisher<[RestaurantModel], Error>
}

class HomeUseCaseImpl: HomeUseCase {

    private let repository: RestaurantRepository

    init(repository: RestaurantRepository) {
        self.repository = repository
    }

    func getRestaurants() -> AnyPublisher<[RestaurantModel], Error> {
        return repository.getRestaurants()
    }

    func searchRestaurants(query: String) -> AnyPublisher<[RestaurantModel], Error> {
        return repository.searchRestaurant(query: query)
    }
}
