//
//  RestaurantListWidget.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 02/12/20.
//

import SwiftUI

struct RestaurantListWidget: View {

    var restaurantModel: RestaurantModel

    init(restaurantModel: RestaurantModel) {
        self.restaurantModel = restaurantModel
    }

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                ImageNetwork(url: restaurantModel.smallPicture, width: 100, height: 100)
                    .cornerRadius(8)

                VStack(alignment: .leading, spacing: 8) {
                    Text(restaurantModel.name)
                        .titleStyle()

                    HStack {
                        HStack(spacing: 4) {
                            Image.icStar
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", restaurantModel.rating))
                                .bold()
                                .descriptionStyle()
                        }

                        HStack(spacing: 4) {
                            Image.icMap
                                .foregroundColor(.gray)
                            Text(restaurantModel.city)
                                .bold()
                                .descriptionStyle()
                        }

                        Spacer()
                    }

                    Text(restaurantModel.description)
                        .descriptionStyle()
                        .lineLimit(2)
                }
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4, x: 0, y: 4)
    }
}

struct RestaurantListWidget_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListWidget(restaurantModel: DataFaker.getRestaurant())
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}
