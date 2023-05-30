//
//  GridView.swift
//  TicTacToe
//
//  Created by Eddington, Nick on 5/30/23.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var ticVm: TicViewModel
    
    var body: some View {
        ZStack{
            VStack(spacing:3) {
                let n = 3
                ForEach(0..<n, id:\.self) { r in
                    HStack(spacing:3) {
                        ForEach(0..<n, id:\.self) { c in
                            let index = (r*n) + c
                            
                            Button(action: {
                                // set the cell to X or O
                                ticVm.setCell(index: index,
                                              cellValue: ticVm.isXTurn ? .x : .o)
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.clear)
                                    Group {
                                        if ticVm.grid[index] == .b {
                                            // leave cell blank
                                        } else if ticVm.grid[index] == .x {
                                            XShape()
                                                .fill(Color(red: 150/255, green: 20/255, blue: 20/255))
                                        } else {
                                            OShape()
                                                .fill(Color(red: 100/255, green: 20/255, blue: 140/255))
                                        }
                                    }
                                    .padding(12)
                                }
                                .frame(width: 80, height: 80)
                            }
                        }
                    }
                }
            }
            GridLinesView()
                .foregroundColor(Color.indigo)
                .frame(width: 240, height: 240)
        }
    }
}
struct GridView_Previews: PreviewProvider {
    static var ticVm = TicViewModel()
    
    static var previews: some View{
        GridView(ticVm: ticVm)
    }
}
