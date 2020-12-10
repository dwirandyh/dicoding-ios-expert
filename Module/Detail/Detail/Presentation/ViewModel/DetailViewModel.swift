//
//  DetailViewModel.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation
import Combine
import Common

public class DetailViewModel: ObservableObject {

    private var cancellable: Set<AnyCancellable> = []
    private let detailUseCase: DetailUseCase

    @Published var restaurantDetail: RestaurantDetailModel?

    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
    }

    func getDetailRestaurant(restaurantId: String) {
        self.detailUseCase.getRestaurantDetail(restaurantId: restaurantId)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    break
                case .finished:
                    break
                }
            }, receiveValue: { restaurant in
                self.restaurantDetail = restaurant
            })
            .store(in: &self.cancellable)
    }

    func addFavorite() {
        guard let restaurant = self.restaurantDetail else { return }
        self.detailUseCase.addFavorite(restaurant: restaurant)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    break
                case .finished:
                    break
                }
            }, receiveValue: { isSuccess in
                self.restaurantDetail?.isFavorite = isSuccess
            })
            .store(in: &self.cancellable)
    }
}
