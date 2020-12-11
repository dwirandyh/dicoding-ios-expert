//
//  ReviewModel.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation

public struct ReviewModel: Equatable, Identifiable {
    public var id = UUID()
    public let name: String
    public let review: String
    public let date: String
}
