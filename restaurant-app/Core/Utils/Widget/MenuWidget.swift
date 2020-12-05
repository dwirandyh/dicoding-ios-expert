//
//  MenuWidget.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import SwiftUI

struct MenuWidget: View {

    var name: String

    init(name: String) {
        self.name = name
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(self.name)
                .frame(maxWidth: .infinity)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2, x: 0, y: 0)
    }
}

struct MenuWidget_Previews: PreviewProvider {
    static var previews: some View {
        MenuWidget(name: "Coffee")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
