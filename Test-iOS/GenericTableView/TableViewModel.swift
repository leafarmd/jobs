//
//  TableViewModel.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 27/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

import UIKit

//typealias UserCellConfig = TableCellConfigurator<UserCell, User>
//typealias MessageCellConfig = TableCellConfigurator<MessageCell, String>
//typealias ImageCellConfig = TableCellConfigurator<ImageCell, URL>

final class TableViewModel {
    
    let items: [CellConfigurator]
    
    init(items: [CellConfigurator]) {
        self.items = items
    }
    
//    let items: [CellConfigurator] = [
//        UserCellConfig.init(item: User(name: "John Smith", imageName: "user3")),
//
//        MessageCellConfig.init(item: "Hi, this is a message text. Tra la la. Tra la la."),
//        ImageCellConfig.init(item: Bundle.main.url(forResource: "beach@2x", withExtension: "jpg")!),
//        UserCellConfig.init(item:User(name: "Jessica Wood", imageName: "user2")),
//        MessageCellConfig.init(item: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
//        TableCellConfigurator<WarningCell, String>.init(item: "Hey!! It's a warning!!!!")
//    ]
}
