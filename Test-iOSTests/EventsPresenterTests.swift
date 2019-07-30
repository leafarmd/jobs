//
//  EventsPresenterTests.swift
//  Test-iOSTests
//
//  Created by Rafael Damasceno on 29/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import Quick
import Nimble

@testable import Test_iOS

final class EventsPresenterTests: QuickSpec {
    
    override func spec() {
        
        describe("EventsPresenter") {
            var view: EventsViewSpy?
            var service: EventsServiceSpy?
            var router: EventsRouterSpy?
            var presenter: EventsPresenter?
            
            func setup() {
                view = EventsViewSpy()
                service = EventsServiceSpy()
                router = EventsRouterSpy()
                presenter = EventsPresenter(service: service!, router: router!)
                service?.output = presenter!
                presenter?.attachView(view!)
            }
            
            beforeEach {
                setup()
            }
            
            describe("when the view has been attached") {
                
                it("it will start loading feedback") {
                    expect(view?.showLoadingFeedbackCalled) == true
                }
                
                it("it will fetch data from service") {
                    expect(service?.fethEventCalled) == true
                }
            }
            
            describe("when the service return with success") {
                
                beforeEach {
                     service?.output?.fetchEventsSucceeded(output: EventsOutput.dummy)
                }
                
                it("will stop loading feedback") {
                    expect(view?.hideLoadingFeedbackCalled) == true
                }
                
                it("will reoload data") {
                    expect(view?.reoladDataCalled) == true
                    expect(view?.modelPassed?.count) == 1
                }
            }
            
            describe("when the service return with error") {
                
                beforeEach {
                    setup()
                    service?.output?.fetchEventsFailed(error: "error message value")
                }
                
                it("will hide loading feedback") {
                    expect(view?.hideLoadingFeedbackCalled) == true
                }
                
                it("will show error message") {
                    expect(view?.showMessageCalled) == true
                    expect(view?.titlePassed) == "Error"
                    expect(view?.messagePassed) == "error message value"
                }
            }
        }
    }
}

private class EventsViewSpy: EventsView {
    var showLoadingFeedbackCalled: Bool?
    var hideLoadingFeedbackCalled: Bool?
    var reoladDataCalled: Bool?
    var modelPassed: [EventModel]?
    var showMessageCalled:Bool?
    var titlePassed: String?
    var messagePassed: String?
    
    func showLoadingFeedback() {
        showLoadingFeedbackCalled = true
    }
    
    func hideLoadingFeedback() {
        hideLoadingFeedbackCalled = true
    }
    
    func reloadData(with model: [EventModel]) {
        reoladDataCalled = true
        modelPassed = model
    }
    
    func showMessage(title: String, message: String) {
        showMessageCalled = true
        titlePassed = title
        messagePassed = message
    }
}

private class EventsServiceSpy: EventsServiceInput {
    var output: EventsServiceOutput?
    
    var fethEventCalled: Bool?
    
    func fetchEvents() {
        fethEventCalled = true
    }
    
    
}

private class EventsRouterSpy: EventsRoutering {
    var makeViewControllerCalled: Bool?
    var navigateToEventDetailCalled: Bool?
    var idPassed: String?
    
    func makeViewController() -> UIViewController {
        makeViewControllerCalled = true
        return UIViewController()
    }
    
    func navigateToEventDetail(with id: String) {
        navigateToEventDetailCalled = true
        idPassed = id
    }
}

extension EventsOutput {
    static var dummy: [EventsOutput] {
        return [EventsOutput(id: "1",
                             title: "title value",
                             price: 1.0,
                             latitude: LocationOutput.double(1.0),
                             longitude: LocationOutput.string("2.0"),
                             image: "image value",
                             description: "description value",
                             date: 0, cupons: [CuponOutput(id: "1",
                                                           eventID: "1",
                                                           discount: 10)],
                             people: [PeopleOutput(id: "1",
                                                   eventID: "1",
                                                   name: "name value",
                                                   picture: "picture value")])]
    }
}

