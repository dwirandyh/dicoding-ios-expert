//
//  ObjectMapper.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation
import RealmSwift

extension Array where Element == RestaurantListDetailResponse {
    func mapToModel() -> [RestaurantModel] {
        self.map { (result) in
            return RestaurantModel(id: result.id ?? "",
                                   name: result.name ?? "",
                                   description: result.description ?? "",
                                   smallPicture: "https://restaurant-api.dicoding.dev/images/small/\(result.pictureId ?? "")",
                                   mediumPicture: "https://restaurant-api.dicoding.dev/images/medium/\(result.pictureId ?? "")",
                                   city: result.city ?? "",
                                   rating: result.rating ?? 0)
        }
    }
}

extension Array where Element == RestaurantEntity {
    func mapToModel() -> [RestaurantModel] {
        self.map { result in
            return RestaurantModel(id: result.id,
                                   name: result.name,
                                   description: result.overview,
                                   smallPicture: result.smallPictureUrl,
                                   mediumPicture: result.mediumPictureUrl,
                                   city: result.city,
                                   rating: result.rating)
        }
    }
}

extension RestaurantDetailResult {
    func mapToModel() -> RestaurantDetailModel {
        var formattedCategory: String = ""
        if let restaurantCategory = self.categories {
            let category: [String] = restaurantCategory.map { ($0.name ?? "") }
            formattedCategory = category.joined(separator: ", ")
        }

        var reviewModel: [ReviewModel] = []
        if let restaurantReviews = self.reviews {
            reviewModel = restaurantReviews.map { ReviewModel(name: $0.name ?? "", review: $0.review ?? "", date: $0.date ?? "") }
        }

        return RestaurantDetailModel(id: self.id ?? "",
                                     name: self.name ?? "",
                                     description: self.description ?? "",
                                     city: self.city ?? "",
                                     address: self.address ?? "",
                                     smallPicture: "https://restaurant-api.dicoding.dev/images/small/\(self.pictureId ?? "")",
                                     mediumPicture: "https://restaurant-api.dicoding.dev/images/medium/\(self.pictureId ?? "")",
                                     categories: formattedCategory,
                                     foods: (self.menus?.foods?.map { $0.name ?? "" } ?? []),
                                     drinks: (self.menus?.drinks?.map { $0.name ?? "" } ?? []),
                                     rating: self.rating ?? 0,
                                     reviews: reviewModel,
                                     isFavorite: false
                                     )
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array: [T] = []
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}
