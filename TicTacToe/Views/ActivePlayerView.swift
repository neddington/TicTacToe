//
//  ActivePlayerView.swift
//  TicTacToe
//
//  Created by Eddington, Nick on 5/30/23.
//

import SwiftUI

struct ActivePlayerView: View {
    var isActive: Bool
    var player: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(isActive ? Color.cyan : Color.green)
            .frame(width:120, height:30)
            .overlay(
                Text(player))
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .scaleEffect(isActive ? 1.0 : 0.85)
            .animation(.easeInOut(duration: 0.5))
    }
}

