//
//  RestaraurantDetailResponse.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation

struct RestaurantDetailResponse: Decodable {
    let error: Bool?
    let message: String?
    let count: Int?
    let restaurant: RestaurantDetailResult
}
