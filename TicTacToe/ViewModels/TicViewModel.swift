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
    
    var grid: [Cell] {
        get { ticModel.grid }
    }

}
