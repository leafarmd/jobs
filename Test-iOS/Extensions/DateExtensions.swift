//
//  DateExtensions.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 27/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

extension Date {
    func fromMilli(from milliseconds: Double) -> String{
        let date = Date.init(timeIntervalSince1970: TimeInterval(milliseconds)/1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        
        return formatter.string(from: date)
    }
}
