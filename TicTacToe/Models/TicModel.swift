//
//  TicModel.swift
//  TicTacToe
//
//  Created by Eddington, Nick on 5/30/23.
//

import Foundation

enum Cell: String {
    case x = "X"
    case o = "O"
    case b = "" // blank
}


enum Winner {
    case o, x, none
}


struct TicModel {
    private var _grid: [Cell]
    private var _winner: Winner
    private var _playerXTurn: Bool
    private var _winningLines: [Bool]
    
    init() {
        _grid = []
        for _ in 0..<9 {
            _grid.append(Cell.b)
        }
        _winningLines = []
        for _ in 0..<8 {
            _winningLines.append(false)
        }
        _winner = .none
        _playerXTurn = true
    }
    
    var winningLines: [Bool] {
        get { _winningLines }
    }
    
    var isXTurn: Bool {
        get { _playerXTurn }
    }

    var grid: [Cell] {
        get { _grid }
    }

    var winner: Winner {
        get { _winner }
    }

    var isGridFull: Bool {
        get { grid.filter { $0 == Cell.b }.count == 0 }
    }
    
    mutating func setCell(n:Int, c: Cell) {
        guard _grid.indices.contains(n) else {
            return
        }
        guard _grid[n] == .b else {
            return
        }
        _grid[n] = c
        _playerXTurn.toggle()
    }

    mutating func updateGameStatus() -> Bool {
        var result = false
        // There are 8 possible winning options in Tic Tac Toe
        // The order of these options needs to match _winningLines
        let winOptions: [Set<Int>] = [
            [0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]]

        let oCells: Set<Int> = Set(_grid.indices.map { _grid[$0] == Cell.o ? $0 : -1 })
        let xCells: Set<Int> = Set(_grid.indices.map { _grid[$0] == Cell.x ? $0 : -1 })

        for (i, win) in winOptions.enumerated() {
            if win.intersection(xCells) == win {
                _winningLines[i] = true
                _winner = .x
                result = true
            }
            if win.intersection(oCells) == win {
                _winningLines[i] = true
                _winner = .o
                result = true
            }
        }

        return result
    }


    
}


