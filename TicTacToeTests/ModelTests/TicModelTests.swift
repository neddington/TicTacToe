//
//  TicModelTests.swift
//  TicTacToeTests
//
//  Created by Eddington, Nick on 5/30/23.
//

import XCTest
@testable import TicTacToe

class TicModelTests: XCTestCase {

    func test_initialValue_NineCells() {
        // Arrange
        let ticModel = TicModel()
        
        // Act
        
        // Assert
        XCTAssertEqual(ticModel.grid.count, 9)
    }

    func test_initialValue_IsBlank() {
        // Arrange
        let ticModel = TicModel()
        
        // Act
        
        // Assert
        XCTAssertEqual((ticModel.grid.filter { $0 == cell.b }.count), 9)
    }

}
