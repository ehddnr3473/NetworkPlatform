//
//  ResponseDecoder.swift
//  
//
//  Created by 김동욱 on 2023/03/20.
//

import Foundation

protocol ResponseDecoder {
    func decode<T: Decodable>(_ data: Data, type: T.Type) throws -> T
}

struct JSONResponseDecoder: ResponseDecoder {
    private let jsonDecoder = JSONDecoder()
    
    func decode<T>(_ data: Data, type: T.Type) throws -> T where T: Decodable {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
