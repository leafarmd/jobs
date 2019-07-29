//
//  EventDetailRoutering.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 28/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class EventDetailRouter: EventDetailRoutering {
    
    private let navigator: UINavigationController
    private let id: String
    weak var router: CheckInRouter?
    
    init(navigator: UINavigationController, id: String) {
        self.navigator = navigator
        self.id = id
    }
    
    func makeViewController() -> UIViewController {
        let service = EventDetailService(id: id)
        let presenter = EventDetailPresenter(service: service, router: self)
        service.output = presenter
        let dataSoruce = TableViewDataSoruce()
        let viewController = EventDetailViewController(presenter: presenter, dataSource: dataSoruce)
        
        return viewController
    }
    
    func navigateToCheckIn(model: EventDetailModel) {
        let router = CheckInRouter(navigator: navigator, model: model)
        navigator.pushViewController(router.makeViewController(), animated: true)
        
        self.router = router
    }
}
