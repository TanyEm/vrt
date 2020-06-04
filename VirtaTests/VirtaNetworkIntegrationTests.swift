//
//  VirtaTests.swift
//  VirtaTests
//
//  Created by Tatiana Podlesnykh on 16.5.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import XCTest
@testable import Virta

class VirtaNetworkIntegrationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAuthRequestGetAuth() throws {
        let authRequest = AuthRequest()
        
        let expectation = self.expectation(description: "auth")

        var expected = AuthToken(token: "")
        
        authRequest.getAuth(email: "candidate1@virta.global", password: "1Candidate!") { result in
            switch result {
            case .success(let data):
                expected = data
            case .failure(let error):
                print(error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
                
        // check the token is not empty
        XCTAssertTrue(expected.token.count > 0)
    }
    
    func testStationRequestGetStations() throws {
        let stationRequest = StationRequest()
        
        let expectation = self.expectation(description: "stationsList")

        var expected = [BasicStationInfo]()
        
        // location: 60.2, 24.7
        stationRequest.getStations(latMin: 50.1, latMax: 60.3, longMin: 14.6, longMax: 24.8) { result in
            switch result {
            case .success(let data):
                expected = data
            case .failure(let error):
                print(error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        // check the token is not empty
        XCTAssertEqual(expected.count, 7)

        // ID = 8957
        //XCTAssertEqual(expected[0].name, "Hardy Barth Integration Test")
    }
    
    func testStationRequestGetStationByID() throws {
        let stationRequest = StationRequest()
        
        let expectation = self.expectation(description: "stationDescription")
        
        var expectedID = Int()
        
        // ID = 8957
        stationRequest.getStationByID(id: 8957) { (result) in
            switch result {
            case .success(let data):
                expectedID = data.id!
            case .failure(let error):
                print(error)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        
        // check the token is not empty
        XCTAssertEqual(expectedID, 8957)
    }
}

