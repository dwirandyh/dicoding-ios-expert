//
//  HomeViewModelTest.swift
//  HomeTests
//
//  Created by Dwi Randy Herdinanto on 11/12/20.
//

import XCTest
import Combine
import Common
@testable import Home

final class HomeViewModelTest: XCTestCase {

    private var cancellable: Set<AnyCancellable> = []

    private var homeUseCaseMock: HomeUseCaseMock!
    private var sut: HomeViewModel<ImmediateScheduler>!

    override func setUpWithError() throws {
        self.homeUseCaseMock = HomeUseCaseMock()
        self.sut = HomeViewModel(homeUseCase: self.homeUseCaseMock, scheduler: ImmediateScheduler.shared)
    }

    override func tearDownWithError() throws {
        self.homeUseCaseMock = nil
        self.sut = nil
    }

    func testGetRestaurant() throws {
        // Given
        let response: AnyPublisher<[RestaurantModel], Error>!
        response = Future<[RestaurantModel], Error> { completion in
            completion(.success(RestaurantModel.fakeRestaurantList()))
        }.eraseToAnyPublisher()

        self.homeUseCaseMock.getRestaurantResponse = response

        // When
        self.sut.getRestaurants()

        // Then
        XCTAssertEqual(self.sut.restaurants, RestaurantModel.fakeRestaurantList())
        XCTAssertFalse(self.sut.isLoading)
    }

    func testGetRestaurantFailed() throws {
        // Given
        let response: AnyPublisher<[RestaurantModel], Error>!
        response = Future<[RestaurantModel], Error> { completion in
            completion(.failure(NetworkError.invalidResponse))
        }.eraseToAnyPublisher()

        self.homeUseCaseMock.getRestaurantResponse = response

        // When
        self.sut.getRestaurants()

        // Then
        XCTAssertEqual(self.sut.restaurants.count, 0)
        XCTAssertFalse(self.sut.isLoading)
    }

    func testSearchRestaurant() throws {
        // Given
        let response: AnyPublisher<[RestaurantModel], Error>!
        response = Future<[RestaurantModel], Error> { completion in
            completion(.success(RestaurantModel.fakeRestaurantList()))
        }.eraseToAnyPublisher()

        self.homeUseCaseMock.searchRestaurantResponse = response

        // When
        self.sut.searchRestaurant(query: "kafe")

        // Then
        XCTAssertEqual(self.sut.restaurants, RestaurantModel.fakeRestaurantList())
        XCTAssertFalse(self.sut.isLoading)
    }

    func testSearchRestaurantFailed() throws {
        // Given
        let response: AnyPublisher<[RestaurantModel], Error>!
        response = Future<[RestaurantModel], Error> { completion in
            completion(.failure(NetworkError.empty))
        }.eraseToAnyPublisher()

        self.homeUseCaseMock.searchRestaurantResponse = response

        // When
        self.sut.searchRestaurant(query: "")

        // Then
        XCTAssertEqual(self.sut.restaurants.count, 0)
        XCTAssertFalse(self.sut.isLoading)
    }
}

final class HomeUseCaseMock: HomeUseCase {

    var getRestaurantResponse: AnyPublisher<[RestaurantModel], Error>!
    var searchRestaurantResponse: AnyPublisher<[RestaurantModel], Error>!

    func getRestaurants() -> AnyPublisher<[RestaurantModel], Error> {
        return self.getRestaurantResponse
    }

    func searchRestaurants(query: String) -> AnyPublisher<[RestaurantModel], Error> {
        return self.searchRestaurantResponse
    }
}

extension RestaurantModel {
    static func fakeRestaurantList() -> [RestaurantModel] {
        var restaurantList: [RestaurantModel] = []
        restaurantList.append(RestaurantModel(id: "1",
                                              name: "melting pot",
                                              description: "melting pot description",
                                              smallPicture: "https://picture.small.com",
                                              mediumPicture: "https://picture.medium.com",
                                              city: "medan",
                                              rating: 0))
        return restaurantList
    }
}
