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
        VStack(spacing:3) {
            let n = 3
            ForEach(0..<n, id:\.self) { r in
                HStack(spacing:3) {
                    ForEach(0..<n, id:\.self) { c in
                        let index = (r*n) + c
                        
                        Button(action: {
                            // set the cell to X or O
                            ticVm.setCell(index: index,
                                          cellValue: .x)
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth:5)
                                VStack {
                                    Text("\(ticVm.grid[index].rawValue)")
                                }
                            }
                            .frame(width: 80, height: 80)
                        }
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var ticVm = TicViewModel()
    
    static var previews: some View{
        GridView(ticVm: ticVm)
    }
}
