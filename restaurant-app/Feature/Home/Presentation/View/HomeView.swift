//
//  ContentView.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import SwiftUI
import Combine
import Resolver
import Common
import Routing

struct HomeView: View {

    @ObservedObject var homeViewModel: HomeViewModel<RunLoop>

    init(viewModel: HomeViewModel<RunLoop>) {
        self.homeViewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Good morning,")
                        .descriptionStyle()
                        .bold()

                    Text("Happy Freeyay!")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black100)
                }

                Spacer()
                    .frame(height: 16)

                HStack(spacing: 16) {
                    Image.icSearch
                        .foregroundColor(.black100)

                    TextField("Search restaurant", text: self.$homeViewModel.keyword)
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(Color.black10)
                .cornerRadius(8)

                Spacer()
                    .frame(height: 24)

                if self.homeViewModel.isLoading {
                    HStack {
                        Spacer()
                        VStack {
                            LoadingWidget(isLoading: self.$homeViewModel.isLoading, style: .large)
                            Text("Loading, please wait")
                        }
                        Spacer()
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(self.homeViewModel.restaurants, id: \.id) { restaurant in
                            NavigationLink(
                                destination: Routing.shared.navigateToDetail(restaurantId: restaurant.id
                                )) {
                                RestaurantListWidget(restaurantModel: restaurant)
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationBarHidden(true)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            .onAppear {
                self.homeViewModel.getRestaurants()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: Resolver.resolve())
    }
}
