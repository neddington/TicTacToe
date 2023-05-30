//
//  TicViewModel.swift
//  TicTacToe
//
//  Created by Eddington, Nick on 5/30/23.
//

import Foundation

class TicViewModel: ObservableObject {
    @Published private var ticModel: TicModel

    init() {
        ticModel = TicModel()
    }
    
    var isXTurn: Bool {
        get { ticModel.isXTurn }
    }
    
    var grid: [Cell] {
        get { ticModel.grid }
    }
    
    var winner: Winner{
        get { ticModel.winner }
    }
    
    var isGameOver: Bool {
        get { ticModel.isGridFull || (ticModel.winner != .none)
            
            
        }
    }
    
    var winnerDisplay: String {
        get {
            var message = ""
            if ticModel.winner == .x {
                message = "X Wins"
            }
            else if ticModel.winner == .o {
                message = "O Wins"
            }
            else if ticModel.winner == .none && isGameOver {
                message = "Draw"
            }
            return message
        }
    }
    
    func setCell(index: Int, cellValue: Cell) {
        ticModel.setCell(n: index, c: cellValue)
        
        _ = ticModel.updateGameStatus()
    }
    
        func reset() {
            // initialize a new model
            ticModel = TicModel()
        }
}
