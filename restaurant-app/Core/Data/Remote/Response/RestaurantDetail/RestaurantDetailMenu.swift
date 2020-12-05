//
//  RestaurantDetailMenu.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation

struct RestaurantDetailMenu: Decodable {
    let foods: [RestaurantDetailItem]?
    let drinks: [RestaurantDetailItem]?
}
