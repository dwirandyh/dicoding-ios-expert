//
//  RestaurantResponse.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation

struct RestaurantListResultResponse: Decodable {

    let error: Bool?
    let message: String?
    let count: Int?
    let restaurants: [RestaurantListDetailResponse]?
}
