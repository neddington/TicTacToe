//
//  GridLinesView.swift
//  TicTacToe
//
//  Created by Eddington, Nick on 5/30/23.
//

import SwiftUI

struct GridLinesView: View {
    var body: some View {
        GeometryReader { gr in
            let w = gr.size.width
            let h = gr.size.height
 
            ZStack {
                VStack(spacing:0) {
                    HStack(spacing:0) {
                        Spacer()
                        RoundedRectangle(cornerRadius: w*0.02)
                            .frame(width: w*0.02, height: h*0.98)
                        Spacer()
                        RoundedRectangle(cornerRadius: w*0.02)
                            .frame(width: w*0.02, height: h*0.98)
                        Spacer()
                    }
                }
                HStack(spacing:0) {
                    VStack(spacing:0) {
                        Spacer()
                        RoundedRectangle(cornerRadius: w*0.02)
                            .frame(width: w*0.98, height: h*0.02)
                        Spacer()
                        RoundedRectangle(cornerRadius: w*0.02)
                            .frame(width: w*0.98, height: h*0.02)
                        Spacer()
                    }
                }
            }
        }
    }
}
