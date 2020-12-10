//
//  FavoriteViewModel.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation
import Combine
import Common

class FavoriteViewModel: ObservableObject {

    private var cancellable: Set<AnyCancellable> = []
    private let favoriteUseCase: FavoriteUseCase

    @Published var restaurants: [RestaurantModel] = []
    @Published var keyword: String = ""
    @Published var isLoading: Bool = true

    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }

    func getRestaurants() {
        self.isLoading = true
        self.favoriteUseCase.getFavorite()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveValue: { restaurants in
                self.restaurants = restaurants
            })
            .store(in: &self.cancellable)
    }

}
