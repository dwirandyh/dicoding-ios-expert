//
//  Restaurant.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation

struct RestaurantListDetailResponse: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let pictureId: String?
    let city: String?
    let rating: Float?
}
