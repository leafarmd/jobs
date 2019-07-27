//
//  AppDelegate.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 26/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    private let navigator = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        makeViewController()
        
        return true
    }
    
    private func makeViewController() {
        navigator.isNavigationBarHidden = true
        
        let string = "this is a generic tableview test"
        let items: [CellConfigurator] = [ TestCellConfig(item: string)]
        let model = TableViewModel(items: items)
        let dataSource = TableViewDataSoruce(model: model)
        let viewController = TableViewController(dataSoruce: dataSource)
        
        window.rootViewController = navigator
        window.makeKeyAndVisible()
        window.rootNavigationController?.pushViewController(viewController, animated: false)
    }
}

extension UIWindow {
    var rootNavigationController: UINavigationController? {
        return rootViewController as? UINavigationController
    }
}
