//
//  EventDetailViewcontroller.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 28/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class EventDetailViewController: TableViewController {
    
    private let presenter: EventDetailPresenter
    
    init(presenter: EventDetailPresenter, dataSource: TableViewDataSoruce) {
        self.presenter = presenter
        
        super.init(dataSoruce: dataSource, nibName: "EventDetailViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(self)
    }
}

extension EventDetailViewController: EventDetailView {
    
    func showLoadingFeedback() {
        Loading.start()
    }
    
    func hideLoadingFeedback() {
        Loading.stop()
    }
    
    func reloadData(with model: EventDetailModel) {
        dataSoruce.model.items.append(EventDetailCellConfig(item: model))
        dataSoruce.model.items.append(CheckInCellConfig(item: (model, self)))
        
        if let latitude = model.geoLocation.latitude, let longitude = model.geoLocation.longitude {
            dataSoruce.model.items.append((DetailMapCellConfig(item: (latitude, longitude))))
        }
        
        tableView.reloadData()
    }
}

extension EventDetailViewController: CheckInDelegate {
    func checkEvent(with model: EventDetailModel) {
        presenter.presentCheckIn(with: model)
    }
}
