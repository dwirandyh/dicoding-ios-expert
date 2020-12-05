//
//  ReviewModel.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation

struct ReviewModel: Equatable, Identifiable {
    var id = UUID()
    let name: String
    let review: String
    let date: String
}
