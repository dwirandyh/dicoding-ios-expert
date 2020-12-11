//
//  FavoriteView.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import SwiftUI
import Resolver
import Common
import Routing

struct FavoriteView: View {

    @ObservedObject var favoriteViewModel: FavoriteViewModel

    init(viewModel: FavoriteViewModel) {
        self.favoriteViewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("pageGreeting".localized(identifier: .bundleId))
                        .descriptionStyle()
                        .bold()

                    Text("pageTitle".localized(identifier: .bundleId))
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black100)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Spacer()
                    .frame(height: 24)

                if self.favoriteViewModel.isLoading {
                    HStack {
                        Spacer()
                        VStack {
                            LoadingWidget(isLoading: self.$favoriteViewModel.isLoading, style: .large)
                            Text("loadingMessage".localized(identifier: ""))
                        }
                        Spacer()
                    }
                } else {
                    if !self.favoriteViewModel.restaurants.isEmpty {
                        ScrollView(.vertical, showsIndicators: false) {
                            ForEach(self.favoriteViewModel.restaurants, id: \.id) { restaurant in
                                NavigationLink(
                                    destination: Routing.shared.navigateToDetail(restaurantId: restaurant.id)) {
                                    RestaurantListWidget(restaurantModel: restaurant)
                                        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                }
                            }
                        }
                    } else {
                        Text("favoriteEmpty".localized(identifier: .bundleId))
                            .titleStyle()
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                }

                Spacer()
            }
            .navigationBarHidden(true)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            .onAppear {
                self.favoriteViewModel.getRestaurants()
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(viewModel: Resolver.resolve())
    }
}
