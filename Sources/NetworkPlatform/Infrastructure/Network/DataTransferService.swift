//
//  DataTransferService.swift
//  
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation
import Domain
import GoogleMapsGeoCodingSwift

protocol DataTransferService: AnyObject {
    func request(with query: CoordinateRequestDTO) async throws -> Coordinate
}

final class DefaultDataTransferService: DataTransferService {
    private let networkService: GeoCodingNetworkService
    private let decoder: JSONResponseDecoder
    
    init(configuration: Configuration) {
        self.networkService = DefaultGeoCodingNetworkService(key: configuration.key)
        self.decoder = JSONResponseDecoder()
    }
    
    init?() {
        guard let fileURL = Bundle.main.url(forResource: "APIKey", withExtension: "txt") else {
            #if DEBUG
            print("APIKey.txt not found.")
            #endif
            return nil
        }
        
        do {
            let key = try String(contentsOf: fileURL, encoding: .utf8)
            self.networkService = DefaultGeoCodingNetworkService(key: key)
            self.decoder = JSONResponseDecoder()
        } catch {
            return nil
        }
    }
    
    func request(with query: CoordinateRequestDTO) async throws -> Coordinate {
        let data = try await networkService.request(with: query.toNetwork(), EndPoint.default)
        return try decoder.decode(data, type: CoordinateResponseDTO.self).toDomain()
    }
}
