//
//  DefaultCoordinateRepository.swift
//  
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation
import Domain

public struct DefaultCoordinateRepository: CoordinateRepository {
    private let dataTransferService: DataTransferService
    
    public init() {
        self.dataTransferService = DefaultDataTransferService()
    }
    
    public func fetchCoordinate(query: CoordinateQuery) async throws -> Coordinate {
        try await dataTransferService.request()
    }
}
