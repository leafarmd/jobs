//
//  APISupportTypes.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 26/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation
import UIKit

extension API {
    
    enum Result<Success, Failure> where Failure : Error {
        case success(Success)
        case failure(Failure)
    }
    
    enum RequestError: Error {
        case malformedURL
        case requestFailed
        case invalidData
        case decodingFailed
        
        var message: String {
            switch self {
            case .malformedURL:
                return "error with URL requested"
            case .requestFailed:
                return "error with request"
            case .invalidData:
                return "invalid data"
            case .decodingFailed:
                return "data decode failed"
            }
        }
    }
    
    enum HttpMethod: String {
        case POST
        case GET
    }
    
    typealias RequestResult<T> = Result<T, RequestError>
    typealias RequestImageResult = (Result<UIImage, RequestError>) -> Void
    typealias CompletionCallback<T: Decodable> = (RequestResult<T>) -> Void
}

