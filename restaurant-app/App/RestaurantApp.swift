//
//  restaurant_appApp.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import SwiftUI
import Resolver
import Routing
import Favorite
import About

@main
struct RestaurantApp: App {

    init() {
        Routing.shared.registerAllRouter()
    }

    var body: some Scene {
        WindowGroup {
            TabView {
                Routing.shared.navigateToHome()
                    .tabItem {
                        Image.icHouse
                        Text("home".localized(identifier: ""))
                    }

                Routing.shared.navigateToFavorite()
                    .tabItem {
                        Image.icFavoriteFill
                        Text("favorite".localized(identifier: ""))
                    }
                AboutView(name: "Dwi Randy", githubUrl: "https://github.com/dwirandyh", webUrl: "https://github.com/dwirandyh")
                    .tabItem {
                        Image.icAbout
                        Text("about".localized(identifier: ""))
                    }
            }
        }
    }
}
