//
//  EventsTableViewCell.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 28/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

typealias EventsCellConfig = TableCellConfigurator<EventsTableViewCell, EventModel>

class EventsTableViewCell: UITableViewCell, ConfigurableCell {
    
    func configure(data: EventModel) {
        textLabel?.text = data.title
    }
}
