//
//  ResultOutput.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 26/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

struct ResultOutputElement: Decodable {
    let id: String
    let title: String
    let price: Double
    let latitude: Double
    let longitude: Double
    let image: String
    let resultOutputDescription: String
    let date: Int
    let people: [CuponOutput]
    let cupons: [PersonOutput]
}

struct CuponOutput: Decodable {
    let id: String
    let eventID: String
    let discount: Int
}

struct PersonOutput: Decodable {
    let id: String
    let eventID: String
    let name: String
    let picture: String
}

