//
//  ConcentrationTests.swift
//  ConcentrationTests
//
//  Created by Иван Новиков on 18.10.2019.
//  Copyright © 2019 Иван Новиков. All rights reserved.
//

import XCTest
@testable import Concentration

class ConcentrationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let game = Concentration(numberOfPairsOfCards: 2)
        XCTAssertTrue(type(of: game.score) == type(of: Int()))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
