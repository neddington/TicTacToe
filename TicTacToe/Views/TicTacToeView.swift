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
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tic Tac Toe Game")
                    .foregroundColor(Color.indigo)
                    .font(.custom("Helvetica Neue", size: 36, relativeTo: .largeTitle))
                    .fontWeight(.bold)
                
                HStack {
                    ActivePlayerView(
                        isActive: ticVm.isXTurn && !ticVm.isGameOver,
                        player: "Player X")
                    
                    ActivePlayerView(
                        isActive: !ticVm.isXTurn && !ticVm.isGameOver,
                        player: "Player O")
                }
                
                GridView(ticVm: ticVm)
                
                if ticVm.isGameOver {
                    Text("GAME OVER !")
                        .foregroundColor(Color.indigo)
                        .font(.custom("Helvetica Neue", size: 46, relativeTo: .largeTitle))
                        .fontWeight(.bold)
                }
                
                Spacer()
            }
        }
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
