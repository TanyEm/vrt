//
//  VirtaServiceIntegrationTests.swift
//  VirtaTests
//
//  Created by Tatiana Podlesnykh on 18.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import XCTest
@testable import Virta

class VirtaServiceIntegrationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAuthServiceAuthSuccess() throws {
        let authService = AuthService()
        
        let expectation = self.expectation(description: "authServiceAuthSuccess")
        
        let expected = true
        var received: Bool?
        
        authService.auth(email: "candidate1@virta.global", password: "1Candidate!") { (authorized) in
            received = authorized
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertEqual(expected, received)
    }
    
    func testAuthServiceAuthFail() throws {
        let authService = AuthService()
        
        let expectation = self.expectation(description: "authServiceAuthFail")
        
        let expected = false
        var received: Bool?
        
        authService.auth(email: "candidate1@virta.global", password: "WRONGpas!") { (authorized) in
            received = authorized
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertEqual(expected, received)
    }
    
    func testStationsServiceGetStationsSuccess() throws {
        let stationService = StationListService()
        
        let expectation = self.expectation(description: "stationServiceGetStationsListSuccess")
        
        var received = [BasicStationInfo]()

        stationService.getStationList() { (listed) in
            received = listed
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertEqual(received.count, 10)
        
    }
    
}
