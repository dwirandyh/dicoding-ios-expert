//
//  RestaurantEntity.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation
import RealmSwift

class RestaurantEntity: Object {

    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var mediumPictureUrl: String = ""
    @objc dynamic var smallPictureUrl: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var rating: Float = 0

    override class func primaryKey() -> String? {
        return "id"
    }
}
