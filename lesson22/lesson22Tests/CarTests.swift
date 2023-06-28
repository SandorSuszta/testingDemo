//
//  lesson22Tests.swift
//  lesson22Tests
//
//  Created by Volodymyr Rykhva on 28.08.2021.
//

import XCTest
@testable import lesson22

class lesson22Tests: XCTestCase {
    
    var engineMock: Engine!
    var carMock: Car!
    
    override func setUp() {
        super.setUp()
        engineMock = Engine(cylindersCount: 4)
        carMock = Car(engine: engineMock, model: "TestModel")
    }
    
    override func tearDown() {
        super.tearDown()
        engineMock = nil
        carMock = nil
    }
    
    func testCarRide_withNegativeSpeed_setsWrongSpeedWarning() {
        
        // When
        carMock.ride(with: -30)
        //Then
        XCTAssertEqual(carMock?.warning, .wrongSpeed )
    }
    
    func testCarRide_withCorrectSpeed_setsSpeedAndThereIsNoWarning() {
        
        // When
        carMock.ride(with: 100)
        //Then
        XCTAssertEqual(engineMock.engineSpeed, 100)
        XCTAssertNil(carMock.warning)
    }
    
    func testRide_withSpeedGreaterThan200_setsMaxSpeedLimitWarningAndEngineSpeedTo200() {
        
        // When
        carMock.ride(with: 250)
        // Then
        XCTAssertEqual(carMock.warning, .maxSpeedLimit)
        XCTAssertEqual(engineMock.engineSpeed, 200)
    }
}
