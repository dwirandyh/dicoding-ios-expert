//
//  restaurant_appApp.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import SwiftUI
import Resolver

@main
struct RestaurantApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView(viewModel: Resolver.resolve())
                    .tabItem {
                        Image.icHouse
                        Text("Home")
                    }

                FavoriteView(viewModel: Resolver.resolve())
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
