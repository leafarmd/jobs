//
//  CheckInRouter.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 29/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

final class CheckInRouter: CheckInRoutering {
    
    private let navigator: UINavigationController
    private let model: EventDetailModel
    
    init(navigator: UINavigationController, model: EventDetailModel) {
        self.navigator = navigator
        self.model = model
    }
    
    func makeViewController() -> UIViewController {
        let presenter = CheckInPresenter(model: model)
        let viewController = CheckInViewController(presenter: presenter)
        
        return viewController
    }
}
