//
//  CoordinateRequestDTO.swift
//  
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation
import GoogleMapsGeoCodingSwift

struct CoordinateRequestDTO: Encodable {
    let address: String
}

// MARK: - Mapping
extension CoordinateRequestDTO {
    func toNetwork() -> GeoCodingQuery {
        .init(address: address)
    }
}
