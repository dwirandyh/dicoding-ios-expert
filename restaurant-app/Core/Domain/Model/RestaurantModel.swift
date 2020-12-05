//
//  RestaurantModel.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation

struct RestaurantModel: Equatable, Identifiable {
    let id: String
    let name: String
    let description: String
    let smallPicture: String
    let mediumPicture: String
    let city: String
    let rating: Float
}

struct RestaurantDetailModel: Equatable, Identifiable {
    let id: String
    let name: String
    let description: String
    let city: String
    let address: String
    let smallPicture: String
    let mediumPicture: String
    let categories: String
    let foods: [String]
    let drinks: [String]
    let rating: Float
    let reviews: [ReviewModel]
    var isFavorite: Bool
}
