//
//  DummyDataHelper.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 03/12/20.
//

import Foundation

class DataFaker {
    static func getRestaurant() -> RestaurantModel {
        let restaurant: RestaurantModel = RestaurantModel(id: "rqdv5juczeskfw1e867",
                                                          name: "Melting Pot",
                                                          description: "Lorem ipsum dolor sit amet",
                                                          smallPicture: "https://restaurant-api.dicoding.dev/images/small/14",
                                                          mediumPicture: "https://restaurant-api.dicoding.dev/images/medium/14",
                                                          city: "Medan",
                                                          rating: 4.2)
        return restaurant
    }
}
