//
//  EventsPresenter.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 27/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

final class EventsPresenter {
    
    weak var view: EventsView?
    private let service: EventsServiceInput
    
    init(service: EventsServiceInput) {
        self.service = service
    }
    
    func attachView(_ view: EventsView) {
        self.view = view
        
        view.showLoadingFeedback()
        service.fetchEvents()
    }
}

extension EventsPresenter: EventsServiceOutput {
    
    func fetchEventsSucceeded(output: [EventsOutput]) {
        view?.hideLoadingFeedback()
        
        var models: [EventModel] = []
        output.forEach { models.append(EventModel(id: $0.id,
                                                  title: $0.title,
                                                 Description: $0.description,
                                                 date: Date(timeIntervalSince1970: TimeInterval($0.date / 1000)),
                                                 price: $0.price,
                                                 image: $0.image)) }
        view?.reloadData(with: models)
    }
    
    func fetchEventsFailed(error message: String) {
        view?.hideLoadingFeedback()
    }
}
