//
//  RestaurantModel.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation

public struct RestaurantModel: Equatable, Identifiable {
    public let id: String
    public let name: String
    public let description: String
    public let smallPicture: String
    public let mediumPicture: String
    public let city: String
    public let rating: Float

    public init(id: String, name: String, description: String, smallPicture: String, mediumPicture: String, city: String, rating: Float) {
        self.id = id
        self.name = name
        self.description = description
        self.smallPicture = smallPicture
        self.mediumPicture = mediumPicture
        self.city = city
        self.rating = rating
    }
}

public struct RestaurantDetailModel: Equatable, Identifiable {
    public let id: String
    public let name: String
    public let description: String
    public let city: String
    public let address: String
    public let smallPicture: String
    public let mediumPicture: String
    public let categories: String
    public let foods: [String]
    public let drinks: [String]
    public let rating: Float
    public let reviews: [ReviewModel]
    public var isFavorite: Bool

    public init(id: String, name: String, description: String, city : String, address: String, smallPicture: String, mediumPicture: String, categories: String, foods: [String], drinks: [String], rating: Float, reviews: [ReviewModel], isFavorite: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.city = city
        self.address = address
        self.smallPicture = smallPicture
        self.mediumPicture = mediumPicture
        self.categories = categories
        self.foods = foods
        self.drinks = drinks
        self.rating = rating
        self.reviews = reviews
        self.isFavorite = isFavorite
    }
}
