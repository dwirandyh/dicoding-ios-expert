//
//  LocaleDataSource.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation
import Combine
import RealmSwift

protocol LocaleDataSource: class {
    func addFavorite(restaurant: RestaurantEntity) -> AnyPublisher<Bool, Error>
    func getFavorite() -> AnyPublisher<[RestaurantEntity], Error>
    func isFavorite(restaurantId: String) -> AnyPublisher<Bool, Error>
}

class LocaleDataSourceImpl: LocaleDataSource {

    private let realm: Realm?
    init(realm: Realm?) {
        self.realm = realm
    }

    func addFavorite(restaurant: RestaurantEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    let entity = realm.object(ofType: RestaurantEntity.self, forPrimaryKey: restaurant.id)
                    try realm.write {
                        if let restaurantEntity = entity {
                            realm.delete(restaurantEntity)
                            completion(.success(false))
                        } else {
                            realm.add(restaurant, update: .all)
                            completion(.success(true))
                        }
                    }

                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

    func getFavorite() -> AnyPublisher<[RestaurantEntity], Error> {
        return Future<[RestaurantEntity], Error> { completion in
            if let realm = self.realm {
                let restaurants: Results<RestaurantEntity> = realm.objects(RestaurantEntity.self).sorted(byKeyPath: "name", ascending: true)
                completion(.success(restaurants.toArray(ofType: RestaurantEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

    func isFavorite(restaurantId: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                let entity = realm.object(ofType: RestaurantEntity.self, forPrimaryKey: restaurantId)
                if entity == nil {
                    completion(.success(false))
                } else {
                    completion(.success(true))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

}
