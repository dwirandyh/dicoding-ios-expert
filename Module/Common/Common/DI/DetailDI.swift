//
//  DetailDI.swift
//  Detail
//
//  Created by Dwi Randy Herdinanto on 10/12/20.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerDetailService() {
        register {
            DetailViewModel(detailUseCase: resolve())
        }
        register {
            DetailUseCaseImpl(repository: resolve()) as DetailUseCase
        }
    }
}
