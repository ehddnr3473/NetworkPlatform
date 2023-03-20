//
//  CoordinateResponseDTO.swift
//  
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation

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
