//
//  ResourceHelper.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 02/12/20.
//

import SwiftUI

public extension Image {
    static let icStar: Image = Image(systemName: "star.fill")
    static let icMap: Image = Image(systemName: "mappin.and.ellipse")
    static let icSearch: Image = Image(systemName: "magnifyingglass")
    static let icHouse: Image = Image(systemName: "house.fill")
    static let icFavoriteFill: Image = Image(systemName: "heart.fill")
    static let icFavorite: Image = Image(systemName: "heart")
    static let icAbout: Image = Image(systemName: "person.circle.fill")
    static let icBack: Image = Image(systemName: "arrow.left")

    static let profile: Image = Image("profile")
    static let background: Image = Image("profileBackground")

    // MARK: Preview
    static let previewRestaurant: Image = Image("melingpot")
}

public extension Color {
    static let black5: Color = Color("black5")
    static let black10: Color = Color("black10")
    static let black60: Color = Color("black60")
    static let black80: Color = Color("black80")
    static let black100: Color = Color("black100")
}

extension Text {
    public func descriptionStyle() -> Text {
        return self
            .foregroundColor(.black60)
            .font(.system(size: 14))
    }

    public func titleStyle() -> Text {
        return self
            .foregroundColor(.black100)
            .font(.system(size: 18, weight: .bold))
    }

    public func titleSectionStyle() -> Text {
        return self
            .foregroundColor(.black100)
            .font(.system(size: 18))
    }
}
