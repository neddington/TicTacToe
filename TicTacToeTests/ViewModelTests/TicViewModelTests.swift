//
//  TicViewModelTests.swift
//  TicTacToeTests
//
//  Created by Eddington, Nick on 5/30/23.
//

import XCTest
@testable import TicTacToe

class TicViewModelTests: XCTestCase {

    func test_initialValue_nineCells() {
        // Arrange
        let ticViewModel = TicViewModel()
        // Act
        
        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
    }

    func test_initialValue_isBlank() {
        // Arrange
        let ticViewModel = TicViewModel()
        
        // Act
        
        // Assert
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_initialValue_noWinner() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act

        // Assert
        XCTAssertEqual(Winner.none, ticViewModel.winner)
    }

    func test_draw_noWinner() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.o, .x, .o,
                                .x, .o, .x,
                                .x, .o, .x]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }

        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual(Winner.none, ticViewModel.winner)
    }

    func test_fullFrid_xWinner() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .o, .x, .o,
                                .x, .o, .x]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }

        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual(Winner.x, ticViewModel.winner)
    }

    func test_winNotFull_oWinner() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        ticViewModel.setCell(index: 0, cellValue: .o)
        ticViewModel.setCell(index: 1, cellValue: .o)
        ticViewModel.setCell(index: 2, cellValue: .o)

        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual(Winner.o, ticViewModel.winner)
    }
    
    func test_startGame_xPlayerTurn() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act

        // Assert
        XCTAssertTrue(ticViewModel.isXTurn)
    }

    func test_alternateTurns_xTurn() {
        // Arrange
        let ticViewModel = TicViewModel()

        for i in 1...9 {
            // Act
            ticViewModel.setCell(index: i-1, cellValue: .o)

            // Assert
            XCTAssertEqual(i%2==0  , ticViewModel.isXTurn)
        }
    }
    
    func test_startGame_winnerDisplayEmpty() {
           // Arrange
           let ticViewModel = TicViewModel()

           // Act

           // Assert
           XCTAssertEqual("", ticViewModel.winnerDisplay)
       }
    
    func test_xWins_winnerDisplayXWins() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        for i in [0,1,2] {
            ticViewModel.setCell(index: i, cellValue: .x)
        }
        
        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual("X Wins", ticViewModel.winnerDisplay)
    }

    func test_xWinsFull_winnerDisplayXWins() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .o, .x, .o,
                                .x, .o, .x]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }
        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual("X Wins", ticViewModel.winnerDisplay)
    }

    func test_oWins_winnerDisplayOWins() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .b,
                                .o, .o, .o]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }
        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual("O Wins", ticViewModel.winnerDisplay)
    }

    func test_draw_winnerDisplayDraw() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .o,
                                .o, .x, .o]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }
        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual("Draw", ticViewModel.winnerDisplay)
    }
    
    func test_reset_gridEmpty() {
            // Arrange
            let ticViewModel = TicViewModel()

            // Act
            ticViewModel.reset()

            // Assert
            XCTAssertEqual(ticViewModel.grid.count, 9)
            XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
        }
    
    func test_resetAfterOne_gridEmpty() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        ticViewModel.setCell(index: 0, cellValue: .x)
        ticViewModel.reset()

        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_resetGameOver_gridEmpty() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .o,
                                .o, .x, .o]
        for (n,c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }
        ticViewModel.reset()

        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }
    
    func test_winLinesNewGame_empty() {
        // Arrange
        let ticModel = TicModel()

        // Act

        // Assert
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 8)
    }
    
    func test_winLinesTopRow_oneTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [0,1,2] {
            ticModel.setCell(n: i, c: .x)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(ticModel.winningLines[0])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }
    
    func test_winLinesNewGame_noneTrue() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act

        // Assert
        XCTAssertEqual((ticViewModel.winningLines.filter { $0 == false }.count), 8)
    }

    func test_winLinesDraw_noneTrue() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .o,
                                .o, .x, .o]
        for (i,c) in fullGrid.enumerated() {
            ticViewModel.setCell(index: i, cellValue: c)
        }

        // Assert
        XCTAssertEqual((ticViewModel.winningLines.filter { $0 == false }.count), 8)
    }


    func test_winLinesTwoRow_twoTrue() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .o, .x, .o,
                                .o, .x, .o]
        for (i,c) in fullGrid.enumerated() {
            ticViewModel.setCell(index: i, cellValue: c)
        }

        // Assert
        XCTAssertTrue(ticViewModel.winningLines[0])
        XCTAssertTrue(ticViewModel.winningLines[4])
        XCTAssertEqual((ticViewModel.winningLines.filter { $0 }.count), 2)
    }

    func test_winLinesAllRows_eightTrue() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .x, .x, .x,
                                .x, .x, .x]
        for (i,c) in fullGrid.enumerated() {
            ticViewModel.setCell(index: i, cellValue: c)
        }

        // Assert
        XCTAssertEqual((ticViewModel.winningLines.filter { $0  }.count), 8)
    }

}
