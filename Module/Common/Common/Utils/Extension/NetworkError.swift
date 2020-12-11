//
//  NetworkError.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 01/12/20.
//

import Foundation

public enum NetworkError: LocalizedError {
    case invalidResponse
    case empty

    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response"
        case .empty:
            return "Result is empty"
        }
    }
}

public enum DatabaseError: LocalizedError {
    case requestFailed
    case invalidInstance

    public var errorDescription: String? {
        switch self {
        case .requestFailed:
            return "Request failed"
        case .invalidInstance:
            return "Invalid database instance"
        }
    }
}
