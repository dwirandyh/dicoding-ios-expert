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
}
