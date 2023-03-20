//
//  CoordinateResponseDTO.swift
//  
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation
import Domain

public enum CoordinateResponseError: String, Error {
    case emptyResultError = "주소 또는 지명을 확인해주세요."
}

struct CoordinateResponseDTO: Decodable {
    let results: [Result]
    
    // MARK: - Result
    struct Result: Codable {
        let geometry: Geometry
    }
    
    // MARK: - Geometry
    struct Geometry: Codable {
        let location: Location
    }
    
    // MARK: - Location
    struct Location: Codable {
        let lat, lng: Double
    }
}

// MARK: - Mapping
extension CoordinateResponseDTO {
    func toDomain() throws -> Coordinate {
        if !results.isEmpty {
            return .init(
                latitude: results[0].geometry.location.lat,
                longitude: results[0].geometry.location.lng
            )
        } else {
            throw CoordinateResponseError.emptyResultError
        }
    }
}
