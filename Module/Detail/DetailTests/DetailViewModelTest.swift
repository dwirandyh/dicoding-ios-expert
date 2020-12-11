//
//  DetailViewModelTest.swift
//  DetailTests
//
//  Created by Dwi Randy Herdinanto on 11/12/20.
//

import XCTest
import Combine
import Common
@testable import Detail

class DetailViewModelTest: XCTestCase {

    private var cancellable: Set<AnyCancellable> = []

    private var detailUseCaseMock: DetailUseCaseMock!
    private var sut: DetailViewModel<ImmediateScheduler>!

    override func setUpWithError() throws {
        self.detailUseCaseMock = DetailUseCaseMock()
        self.sut = DetailViewModel(detailUseCase: self.detailUseCaseMock, scheduler: ImmediateScheduler.shared)
    }

    override func tearDownWithError() throws {
        self.detailUseCaseMock = nil
        self.sut = nil
    }

    func testGetDetailRestaurant() throws {
        let response: AnyPublisher<RestaurantDetailModel, Error>!
        response = Future<RestaurantDetailModel, Error> { completion in
            completion(.success(RestaurantDetailModel.fakeRestaurantDetail()))
        }.eraseToAnyPublisher()

        self.detailUseCaseMock.getRestaurantDetailResponse = response

        self.sut.getDetailRestaurant(restaurantId: "1")

        XCTAssertEqual(self.sut.restaurantDetail, RestaurantDetailModel.fakeRestaurantDetail())
    }

    func testAddFavorite() throws {
        let response: AnyPublisher<Bool, Error>!
        response = Future<Bool, Error> { completion in
            completion(.success(true))
        }.eraseToAnyPublisher()
        self.detailUseCaseMock.addFavoriteResponse = response
        self.sut.restaurantDetail = RestaurantDetailModel.fakeRestaurantDetail()

        self.sut.addFavorite()

        XCTAssertTrue(self.sut.restaurantDetail?.isFavorite ?? false)
    }

    func testAddFavoriteExist() throws {
        let response: AnyPublisher<Bool, Error>!
        response = Future<Bool, Error> { completion in
            completion(.success(false))
        }.eraseToAnyPublisher()
        self.detailUseCaseMock.addFavoriteResponse = response
        self.sut.restaurantDetail = RestaurantDetailModel.fakeRestaurantDetail()

        self.sut.addFavorite()

        XCTAssertFalse(self.sut.restaurantDetail?.isFavorite ?? true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

final class DetailUseCaseMock: DetailUseCase {
    var getRestaurantDetailResponse: AnyPublisher<RestaurantDetailModel, Error>!
    var addFavoriteResponse: AnyPublisher<Bool, Error>!

    func getRestaurantDetail(restaurantId: String) -> AnyPublisher<RestaurantDetailModel, Error> {
        return self.getRestaurantDetailResponse
    }

    func addFavorite(restaurant: RestaurantDetailModel) -> AnyPublisher<Bool, Error> {
        return self.addFavoriteResponse
    }
}

extension RestaurantDetailModel {
    static func fakeRestaurantDetail() -> RestaurantDetailModel {
        return RestaurantDetailModel(
            id: "1",
            name: "2",
            description: "lorem ipsum",
            city: "Lampung",
            address: "jl ra basyid",
            smallPicture: "https://",
            mediumPicture: "https://",
            categories: "Food & Beverage",
            foods: ["taican", "sate"],
            drinks: ["jus", "mangga"],
            rating: 4.0, reviews: [],
            isFavorite: true
        )
    }
}
