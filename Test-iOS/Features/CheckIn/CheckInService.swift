//
//  CheckInService.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 29/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

final class CheckInService: CheckInServiceInput {
    var output: CheckInServiceOutput?
    
    func checkIn(input: CheckInInput) {
        
        do{
            let jsonData = try JSONEncoder().encode(input)
            API.request(from: .checkIn, type: CheckInOutput.self, method: .POST, data: jsonData) { [weak self] result in
                switch result {
                case .success(let response):
                    if response.code == "200" {
                        self?.output?.checkInSucceeded()
                    } else {
                        self?.output?.checkInFailed(error: "check in failed")
                    }
                case .failure(_):
                    self?.output?.checkInFailed(error: "check in failed")
                }
                
            }
        } catch {
            output?.checkInFailed(error: "check in failed")
        }
        
    }
}


