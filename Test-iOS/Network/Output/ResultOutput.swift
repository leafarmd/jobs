//
//  ResultOutput.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 26/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

struct EventsOutput: Decodable {
    let id: String
    let title: String
    let price: Double
    var latitude: LocationOutput
    var longitude: LocationOutput
    let image: String
    let description: String
    let date: Int
    let cupons: [CuponOutput]
    let people: [PeopleOutput]
}

fileprivate extension Double {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let value = try? container.decode(Double.self) {
            self = value
        }
        if let value = try? container.decode(String.self) {
            if let value = Double(value) {
                self = value
            }
        }
        throw DecodingError.typeMismatch(LocationOutput.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for IntOrString"))
    }
}

enum  LocationOutput: Decodable {
    case double(Double)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Double.self) {
            self = .double(value)
            return
        }
        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }
        throw DecodingError.typeMismatch(LocationOutput.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for IntOrString"))
    }
}

struct CuponOutput: Decodable {
    let id: String?
    let eventID: String?
    let discount: Int?
}

struct PeopleOutput: Decodable {
    let id: String?
    let eventID: String?
    let name: String?
    let picture: String?
}

