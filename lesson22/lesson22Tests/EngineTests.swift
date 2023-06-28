//
//  EngineTests.swift
//  lesson22Tests
//
//  Created by Volodymyr Rykhva on 28.08.2021.
//

import XCTest
@testable import lesson22

class EngineTests: XCTestCase {

    var engineMock: Engine?

    override func setUp() {
        super.setUp()
        // This method is called before the invocation of each test method in the class.
        engineMock = Engine(cylindersCount: 8)
    }

    override func tearDown() {
        // This method is called after the invocation of each test method in the class.
        super.tearDown()

        engineMock = nil
    }

    func testEngineSetup() {
        XCTAssertEqual(engineMock?.cylindersCount, 8)
        XCTAssertEqual(engineMock?.state, .off)
    }

    func testEngineIgnition() {
        // 2. When
        engineMock?.ignition()
        // 3. Then
        XCTAssertEqual(engineMock?.state, .ignitionOn)
    }

    func testEngineRide() {
        // 2. When
        engineMock?.setEngineSpeed(50)
        // 3. Then
        XCTAssertEqual(engineMock?.state, .ride)
        XCTAssertEqual(engineMock?.engineSpeed, 50)
    }
}
