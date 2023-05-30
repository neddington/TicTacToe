//
//  TicViewModelTests.swift
//  TicTacToeTests
//
//  Created by Eddington, Nick on 5/30/23.
//

import XCTest
@testable import TicTacToe

class TicViewModelTests: XCTestCase {

    func test_initialValue_NineCells() {
        // Arrange
        let ticViewModel = TicViewModel()
        // Act
        
        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
    }

    func test_initialValue_IsBlank() {
        // Arrange
        let ticViewModel = TicViewModel()
        
        // Act
        
        // Assert
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }
}

