//
//  HomeViewModel.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {

    private var cancellable: Set<AnyCancellable> = []
    private let homeUseCase: HomeUseCase

    @Published var restaurants: [RestaurantModel] = []
    @Published var keyword: String = ""
    @Published var isLoading: Bool = true

    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase

        self.setupObservable()
    }

    private func setupObservable() {
        self.$keyword
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .dropFirst()
            .sink { self.searchRestaurant(query: $0) }
            .store(in: &self.cancellable)
    }

    private func searchRestaurant(query: String) {
        self.isLoading = true
        self.homeUseCase.searchRestaurants(query: query)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveValue: { restaurants in
                self.restaurants = restaurants
            })
            .store(in: &self.cancellable)
    }

    func getRestaurants() {
        self.isLoading = true
        self.homeUseCase.getRestaurants()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveValue: { restaurants in
                self.restaurants = restaurants
            })
            .store(in: &self.cancellable)
    }

}
