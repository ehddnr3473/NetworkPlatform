//
//  ResponseDecoder.swift
//  
//
//  Created by 김동욱 on 2023/03/20.
//

import Foundation

protocol ResponseDecoder {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

struct JSONResponseDecoder: ResponseDecoder {
    private let jsonDecoder = JSONDecoder()
    
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
