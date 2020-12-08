//
//  DI.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation
import Combine
import Resolver

extension Resolver {
    static func registerHomeServices() {
        register {
            HomeViewModel(homeUseCase: resolve(), scheduler: RunLoop.main)
        }
        register {
            HomeUseCaseImpl(repository: resolve()) as HomeUseCase
        }
    }
}
