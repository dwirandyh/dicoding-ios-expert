//
//  NetworkError.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidResponse
    case empty

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response"
        case .empty:
            return "Result is empty"
        }
    }
}

enum DatabaseError: LocalizedError {
    case requestFailed
    case invalidInstance

    var errorDescription: String? {
        switch self {
        case .requestFailed:
            return "Request failed"
        case .invalidInstance:
            return "Invalid database instance"
        }
    }
}
