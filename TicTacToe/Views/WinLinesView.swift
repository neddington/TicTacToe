//
//  WinLinesView.swift
//  TicTacToe
//
//  Created by Eddington, Nick on 5/30/23.
//

import SwiftUI

struct WinLinesView: View {
    var winningLines: [Bool]
    
    var body: some View {
        GeometryReader { gr in
            let size = min(gr.size.width, gr.size.height)
            let pad = size * 0.145
            let thickness = size * 0.05
            let corner = size * 0.1
            let width = gr.size.width * 0.95
            let height = gr.size.height * 0.9

            ZStack {
                // Horizontal Lines
                HStack {
                    Spacer()
                    VStack(spacing:0) {
                        ForEach([0, 1, 2], id: \.self) {
                            Spacer()
                                .frame(height: pad)
                            RoundedRectangle(cornerRadius: corner)
                                .fill(Color(red: 100/255,
                                            green: 255/255,
                                            blue: 140/255,
                                            opacity: winningLines[$0] ? 0.45 : 0.0))
                                .scaleEffect(winningLines[$0] ? 1.0 : 0.1)
                                .animation(.interpolatingSpring(stiffness: 20, damping: 3))
                                .frame(width: width, height: thickness)
                            Spacer()
                                .frame(height: pad)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                // Vertical Lines
                VStack {
                    Spacer()
                    HStack(spacing:0) {
                        ForEach([3, 4, 5], id: \.self) {
                            Spacer()
                                .frame(width: pad)
                            RoundedRectangle(cornerRadius: corner)
                                .fill(Color(red: 100/255,
                                            green: 255/255,
                                            blue: 140/255,
                                            opacity: winningLines[$0] ? 0.45 : 0.0))
                                .scaleEffect(winningLines[$0] ? 1.0 : 0.1)
                                .animation(.interpolatingSpring(stiffness: 20, damping: 3))
                                .frame(width: thickness, height: height)
                            Spacer()
                                .frame(width: pad)
                        }
                        Spacer()
                    }
                    Spacer()
                }

                // Diagonal Lines
                let diagStart = size * 0.1
                let diagEnd = size * 0.9
                Path { path in
                    path.move(to: CGPoint(x: diagStart, y: diagStart))
                    path.addLine(to: CGPoint(x: diagEnd, y: diagEnd))
                }
                .stroke(Color(red: 100/255,
                              green: 255/255,
                              blue: 140/255,
                              opacity: winningLines[6] ? 0.45 : 0.0),
                        style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                .scaleEffect(winningLines[6] ? 1.0 : 0.1)
                .animation(.interpolatingSpring(stiffness: 20, damping: 3))

                Path { path in
                    path.move(to: CGPoint(x: diagStart, y: diagEnd))
                    path.addLine(to: CGPoint(x: diagEnd, y: diagStart))
                }
                .stroke(Color(red: 100/255,
                              green: 255/255,
                              blue: 140/255,
                              opacity: winningLines[7] ? 0.45 : 0.0),
                        style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                .scaleEffect(winningLines[7] ? 1.0 : 0.1)
                .animation(.interpolatingSpring(stiffness: 20, damping: 3))
            }
        }
    }
}

