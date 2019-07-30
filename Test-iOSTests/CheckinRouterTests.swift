//
//  File.swift
//  Test-iOSTests
//
//  Created by Rafael Damasceno on 29/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Quick
import Nimble

@testable import Test_iOS

final class CheckinRouterTests: QuickSpec {
    
    override func spec() {
        var navigator: UINavigationControllerSpy?
        var router: CheckInRouter?
        
        func setup() {
            navigator = UINavigationControllerSpy()
            router = CheckInRouter(navigator: navigator!, model: EventDetailModel(output: EventsOutput.dummy[0]))
        }
        
        describe("CheckinRouter") {
            
            beforeEach {
                setup()
            }
            
            describe("when the scene is created") {
                
                it("the scene created must not be nil") {
                    expect(router?.makeViewController() is CheckInViewController).to(beTrue())
                    expect(router?.makeViewController().view).toNot(beNil())
                }
            }
        }
    }
}

private class UINavigationControllerSpy: UINavigationController {
    var popViewControllerCalled: Bool?
    
    override func popViewController(animated: Bool) -> UIViewController? {
        popViewControllerCalled = true
        
        return UIViewController()
    }
}


