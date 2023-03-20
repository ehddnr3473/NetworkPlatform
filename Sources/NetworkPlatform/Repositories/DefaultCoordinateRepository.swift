//
//  DefaultCoordinateRepository.swift
//  
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation
import Domain
import GoogleMapsGeoCodingSwift

public enum CoordinateRepositoryError: String, Error {
    case dataTransferServiceError = "네트워크 통신 구성에서 에러가 발생했습니다."
}

public struct DefaultCoordinateRepository: CoordinateRepository {
    private let dataTransferService: DataTransferService?
    
    public init() {
        self.dataTransferService = DefaultDataTransferService()
    }
    
    public func fetchCoordinate(query: CoordinateQuery) async throws -> Coordinate {
        if let dataTransferService = dataTransferService {
            return try await dataTransferService.request()
        } else {
            throw CoordinateRepositoryError.dataTransferServiceError
        }
    }
}
