//
//  EventDetailPresenter.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 28/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Foundation

final class EventDetailPresenter {
    
    weak var view: EventDetailView?
    private let service: EventDetailServiceInput
    
    init(service: EventDetailServiceInput) {
        self.service = service
    }
    
    func attachView(_ view: EventDetailView) {
        self.view = view
        
        view.showLoadingFeedback()
        service.fetchEventDetail()
    }
}

extension EventDetailPresenter: EventDetailServiceOutput {
    
    func fetchEventDetailSucceeded(output: EventsOutput) {
        view?.hideLoadingFeedback()
        view?.reloadData(with: EventDetailModel(output: output))
    }
    
    func fetchEventDetailFailed(error message: String) {
        view?.hideLoadingFeedback()
    }
    
    func presentCheckIn(with model: EventDetailModel) {
        
    }
}

