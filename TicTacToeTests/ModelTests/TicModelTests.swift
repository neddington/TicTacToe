//
//  TicModelTests.swift
//  TicTacToeTests
//
//  Created by Eddington, Nick on 5/30/23.
//

import XCTest
@testable import TicTacToe

class TicModelTests: XCTestCase {
        
    func test_initialValue_nineCells() {
        // Arrange
        let ticModel = TicModel()
        
        // Act
        
        // Assert
        XCTAssertEqual(ticModel.grid.count, 9)
    }
    
    func test_initialValue_nineBlankCells() {
        // Arrange
        let ticModel = TicModel()
        
        // Act

        // Assert
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_setCell3_isX() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 3, c: .x)

        // Assert
        XCTAssertTrue(ticModel.grid[3] == Cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.x }.count), 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 8)
    }

    func test_setCellTwice_ignoreSecond() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 3, c: .x)
        ticModel.setCell(n: 3, c: .o)

        // Assert
        XCTAssertTrue(ticModel.grid[3] == Cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.x }.count), 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 8)
    }

    func test_setCellBlank_ignored() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 3, c: .x)
        ticModel.setCell(n: 3, c: .b)

        // Assert
        XCTAssertTrue(ticModel.grid[3] == Cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.x }.count), 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 8)
    }

    func test_setCell42_isIgnored() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 42, c: .x)

        // Assert
        XCTAssertTrue(ticModel.grid.contains { $0 == Cell.b } )
    }

    func test_initialGame_isNotWon() {
        // Arrange
        var ticModel = TicModel()

        // Act
        let result = ticModel.updateGameStatus()

        // Assert
        XCTAssertFalse(result)
    }

    func test_topLineX_xIsWinner() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [0,1,2] {
            ticModel.setCell(n: i, c: .x)
        }
        let result = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.x, ticModel.winner)
    }

    func test_middleLineX_xIsWinner() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [3,4,5] {
            ticModel.setCell(n: i, c: .x)
        }
        let result = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.x, ticModel.winner)
    }

    func test_bottomLineX_xIsWinner() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [6,7,8] {
            ticModel.setCell(n: i, c: .x)
        }
        let result = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.x, ticModel.winner)
    }

    func test_leftLineO_oIsWinner() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [0,3,6] {
            ticModel.setCell(n: i, c: .o)
        }
        let result = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.o, ticModel.winner)
    }

    func test_middleLineO_oIsWinner() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [1,4,7] {
            ticModel.setCell(n: i, c: .o)
        }
        let result = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.o, ticModel.winner)
    }

    func test_rightLineO_oIsWinner() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [2,5,8] {
            ticModel.setCell(n: i, c: .o)
        }
        let result = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.o, ticModel.winner)
    }

    func test_diagonalO_oIsWinner() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [0,4,8] {
            ticModel.setCell(n: i, c: .o)
        }
        let result = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.o, ticModel.winner)
    }

    func test_diagonalX_xIsWinner() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [2,4,6] {
            ticModel.setCell(n: i, c: .x)
        }
        let result = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.x, ticModel.winner)
    }

    func test_isGridFullNewGame_false() {
        // Arrange
        let ticModel = TicModel()

        // Act

        // Assert
        XCTAssertFalse(ticModel.isGridFull)
    }

    func test_isGridFullPartialGame_false() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in 0..<5 {
            ticModel.setCell(n: i, c: .x)
        }

        // Assert
        XCTAssertFalse(ticModel.isGridFull)
    }

    func test_isGridFullGameOver_true() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in 0..<9 {
            ticModel.setCell(n: i, c: .o)
        }

        // Assert
        XCTAssertTrue(ticModel.isGridFull)
    }
    
    func test_startGame_xPlayerTurn() {
        // Arrange
        let ticModel = TicModel()

        // Act

        // Assert
        XCTAssertTrue(ticModel.isXTurn)
    }

    func test_secondTurn_isO() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 5, c: .x)

        // Assert
        XCTAssertFalse(ticModel.isXTurn)
    }
    
    func test_repeatTurn_ignored() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 5, c: .x)
        ticModel.setCell(n: 5, c: .o)
        ticModel.setCell(n: 5, c: .b)

        // Assert
        XCTAssertFalse(ticModel.isXTurn)
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

    func test_winLinesMiddleRow_oneTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [3,4,5] {
            ticModel.setCell(n: i, c: .o)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(ticModel.winningLines[1])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }
    
    func test_winLinesBottomRow_oneTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [6,7,8] {
            ticModel.setCell(n: i, c: .o)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(ticModel.winningLines[2])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }
    
    func test_winLinesLeftCol_oneTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [0,3,6] {
            ticModel.setCell(n: i, c: .x)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(ticModel.winningLines[3])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesMiddleCol_oneTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [1,4,7] {
            ticModel.setCell(n: i, c: .x)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(ticModel.winningLines[4])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesRightCol_oneTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [2,5,8] {
            ticModel.setCell(n: i, c: .x)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(ticModel.winningLines[5])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesDiag1_oneTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [0,4,8] {
            ticModel.setCell(n: i, c: .o)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(ticModel.winningLines[6])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesDiag2_oneTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        for i in [2,4,6] {
            ticModel.setCell(n: i, c: .o)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertTrue(ticModel.winningLines[7])
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 7)
    }

    func test_winLinesFullDraw_noneTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .x, .x, .o,
                                .o, .x, .o]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertEqual((ticModel.winningLines.filter { $0 == false }.count), 8)
    }

    func test_winLinesFullGridX_allTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .x, .x, .x,
                                .x, .x, .x]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertEqual((ticModel.winningLines.filter { $0 == true }.count), 8)
    }

    func test_winLinesTwo_twoTrue() {
        // Arrange
        var ticModel = TicModel()

        // Act
        let fullGrid: [Cell] = [.x, .x, .x,
                                .o, .x, .o,
                                .o, .x, .o]
        for (i,c) in fullGrid.enumerated() {
            ticModel.setCell(n: i, c: c)
        }
        let _ = ticModel.updateGameStatus()

        // Assert
        XCTAssertEqual((ticModel.winningLines.filter { $0 == true }.count), 2)
    }

}
