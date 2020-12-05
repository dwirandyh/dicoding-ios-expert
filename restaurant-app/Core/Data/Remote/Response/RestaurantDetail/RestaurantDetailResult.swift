//
//  RestaurantDetailRestaurant.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation

struct RestaurantDetailResult: Decodable {

    let id: String?
    let name: String?
    let description: String?
    let city: String?
    let address: String?
    let pictureId: String?
    let categories: [RestaurantDetailItem]?
    let menus: RestaurantDetailMenu?
    let rating: Float?
    let reviews: [RestaurantDetailReview]?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name
        case description
        case city
        case address
        case pictureId
        case categories
        case menus
        case rating
        case reviews = "customerReviews"
    }

}
