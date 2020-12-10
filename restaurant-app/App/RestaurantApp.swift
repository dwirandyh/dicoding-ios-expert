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

@main
struct RestaurantApp: App {

    init() {
        Routing.shared.registerAllRouter()
    }

    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView(viewModel: Resolver.resolve())
                    .tabItem {
                        Image.icHouse
                        Text("Home")
                    }
                Routing.shared.navigateToFavorite()
                    .tabItem {
                        Image.icFavoriteFill
                        Text("Favorite")
                    }
                AboutView()
                    .tabItem {
                        Image.icAbout
                        Text("About")
                    }
            }
        }
    }
}
