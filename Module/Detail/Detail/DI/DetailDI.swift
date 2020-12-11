//
//  DetailDI.swift
//  Detail
//
//  Created by Dwi Randy Herdinanto on 10/12/20.
//

import Foundation
import Resolver

public extension Resolver {
    static func registerDetailService() {
        register {
            DetailViewModel(detailUseCase: resolve(), scheduler: RunLoop.main)
        }
        register {
            DetailUseCaseImpl(repository: resolve()) as DetailUseCase
        }
    }
}
