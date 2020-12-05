//
//  Rating.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import SwiftUI

struct RatingWidget: View {

    var rating: Float = 4.2

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                ForEach((1...5), id: \.self) {
                    if $0 <= Int(rating) {
                        Image.icStar
                            .foregroundColor(.yellow)
                    } else {
                        Image.icStar
                            .foregroundColor(.gray)
                    }
                }

                Text(String(format: "%.1f", 4.2))
                    .bold()
                    .descriptionStyle()
            }
            Text("180 Reviews")
                .foregroundColor(.black80)
                .font(.system(size: 14))
        }
    }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        RatingWidget()
    }
}
