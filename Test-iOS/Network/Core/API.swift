//
//  API.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 26/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation
import UIKit

final class API {
    
    static func request<T: Decodable>(from endpoint: APIEndpoint,
                                      type: T.Type,
                                      method: HttpMethod = .GET,
                                      completion: @escaping CompletionCallback<T>) {
        request(from: endpoint.url,
                type: type,
                method: method,
                completion: completion)
        
    }
    
    private static func request<T: Decodable>(from endpoint: String,
                                              type: T.Type,
                                              method: HttpMethod,
                                              completion: @escaping CompletionCallback<T>) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let baseURL = URLComponents(string: endpoint)
        
        guard let url = baseURL?.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        var request : URLRequest = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                guard error == nil else {
                    completion(.failure(.requestFailed))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let dataType = try decoder.decode(type.self, from: data)
                    completion(.success(dataType))
                } catch {
                    completion(.failure(.decodingFailed))
                }
            }
            }.resume()
    }
    
    static func loadImage(from url: String, completion: @escaping API.RequestImageResult) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalidData))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            guard let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidData))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(image))
            }
        } catch {
            DispatchQueue.main.async {
                completion(.failure(.invalidData))
            }
        }
    }
}





