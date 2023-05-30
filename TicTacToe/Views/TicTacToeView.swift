//
//  TicTacToeView.swift
//  TicTacToe
//
//  Created by Eddington, Nick on 5/30/23.
//

import SwiftUI

struct TicTacToeView: View {
    @ObservedObject private var ticVm: TicViewModel
    
    init() {
        ticVm = TicViewModel()
    }
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe Game")
            
            GridView(ticVm: ticVm)
            
            Spacer()
        }
        
    }
}


struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
