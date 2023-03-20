//
//  DataTransferService.swift
//  
//
//  Created by 김동욱 on 2023/03/15.
//

import Foundation
import Domain

protocol DataTransferService {
    func request() async throws -> Coordinate
}

struct DefaultDataTransferService: DataTransferService {
    private let networkService: GeoCodingNetworkService
    
    func request() async throws -> CoordinateResponseDTO {
        networkService.request()
        // decode
        // mapping
        // repository에서 Coordinate 반환
    }
}

protocol ResponseDecoder {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

struct JSONResponseDecoder: ResponseDecoder {
    private let jsonDecoder = JSONDecoder()
    public init() {}
    func decode<T>(_ data: Data) throws -> T where T : Decodable {
        return try jsonDecoder.decode(T.self, from: data)
    }
}


