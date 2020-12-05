//
//  DI.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 04/12/20.
//

import Foundation
import Resolver

extension Resolver {
    static func registerDetailService() {
        register {
            DetailViewModel(detailUseCase: resolve())
        }
        register {
            DetailUseCaseImpl(repository: resolve()) as DetailUseCase
        }
    }
}
