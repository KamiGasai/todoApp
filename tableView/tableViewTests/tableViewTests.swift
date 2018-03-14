//
//  tableViewTests.swift
//  tableViewTests
//
//  Created by Peitong Shi on 3/10/18.
//  Copyright © 2018 Peitong Shi. All rights reserved.
//

import XCTest
@testable import tableView

class tableViewTests: XCTestCase {
    let a = tableViewController()
    
    func testParameter() {
        XCTAssertEqual(a.game.fps_game?.count, 0) //First time open app there should have nothing in the array
        a.game.fps_game?.append("Counter Strike")
        XCTAssertEqual(a.game.fps_game?.count, 1)//After adding one
        XCTAssertEqual(a.game.fps_game![0], "Counter Strike")
        a.game.fps_game?.remove(at: 0)
        XCTAssertEqual(a.game.fps_game?.count, 0)
    }    
}
