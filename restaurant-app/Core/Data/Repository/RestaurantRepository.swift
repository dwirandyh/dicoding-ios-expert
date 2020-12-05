//
//  RestaurantRepository.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation
import Combine

protocol RestaurantRepository {
    func getRestaurants() -> AnyPublisher<[RestaurantModel], Error>
    func searchRestaurant(query: String) -> AnyPublisher<[RestaurantModel], Error>
    func getRestaurantDetail(restaurantId: String) -> AnyPublisher<RestaurantDetailModel, Error>
    func addFavorite(restaurant: RestaurantEntity) -> AnyPublisher<Bool, Error>
    func getFavorite() -> AnyPublisher<[RestaurantModel], Error>
}

class RestaurantRepositoryImpl: RestaurantRepository {

    private let localeDataSource: LocaleDataSource
    private let remoteDataSource: RemoteDataSource

    init(localeDataSource: LocaleDataSource, remoteDataSource: RemoteDataSource) {
        self.localeDataSource = localeDataSource
        self.remoteDataSource = remoteDataSource
    }

    func getRestaurants() -> AnyPublisher<[RestaurantModel], Error> {
        return self.remoteDataSource.getRestaurants()
            .map { $0.mapToModel() }
            .eraseToAnyPublisher()
    }

    func searchRestaurant(query: String) -> AnyPublisher<[RestaurantModel], Error> {
        return self.remoteDataSource.searchRestaurant(query: query)
            .map { $0.mapToModel() }
            .eraseToAnyPublisher()
    }

    func getRestaurantDetail(restaurantId: String) -> AnyPublisher<RestaurantDetailModel, Error> {
        return Publishers.Zip(self.remoteDataSource.getRestaurantDetail(restaurantId: restaurantId),
                              self.localeDataSource.isFavorite(restaurantId: restaurantId))
            .flatMap { (restaurantDetailResult, isFavorite) -> AnyPublisher<RestaurantDetailModel, Error> in
                return Future<RestaurantDetailModel, Error> { completion in
                    var restaurantDetail = restaurantDetailResult.mapToModel()
                    restaurantDetail.isFavorite = isFavorite
                    completion(.success(restaurantDetail))
                }.eraseToAnyPublisher()
            }.eraseToAnyPublisher()
    }

    func addFavorite(restaurant: RestaurantEntity) -> AnyPublisher<Bool, Error> {
        return self.localeDataSource.addFavorite(restaurant: restaurant)
    }

    func getFavorite() -> AnyPublisher<[RestaurantModel], Error> {
        return self.localeDataSource.getFavorite()
            .map { $0.mapToModel() }
            .eraseToAnyPublisher()
    }
}
