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
    func request() async throws -> Coordinate
}

final class DefaultDataTransferService: DataTransferService {
    private let networkService: GeoCodingNetworkService
    
    public init?() {
        guard let fileURL = Bundle.main.url(forResource: "APIKey", withExtension: "txt") else {
            #if DEBUG
            print("APIKey.txt not found.")
            #endif
            return nil
        }
        do {
            let key = try String(contentsOf: fileURL, encoding: .utf8)
            self.networkService = DefaultGeoCodingNetworkService(key: key)
        } catch {
            return nil
        }
    }
    
    func request() async throws -> Coordinate {
        Coordinate(latitude: 0, longitude: 0)
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


