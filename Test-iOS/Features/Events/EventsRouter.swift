//
//  EventsRouter.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 28/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class EventsRouter: EventsRoutering {
    func makeViewController() -> UIViewController {
        let service = EventsService()
        let presenter = EventsPresenter(service: service)
        service.output = presenter
        let dataSource = TableViewDataSoruce()
        let viewController = EventsViewController(presenter: presenter, dataSource: dataSource)
        return viewController
    }
}
