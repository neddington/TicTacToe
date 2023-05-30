//
//  XShape.swift
//  TicTacToe
//
//  Created by Eddington, Nick on 5/30/23.
//

import SwiftUI

struct XShape: Shape {
    func path(in rect: CGRect) -> Path {
        let size = min(rect.width, rect.height)
        let xOffset = (rect.width - size) / 2.0
        let yOffset = (rect.height - size) / 2.0
        
        func adjustPoint(p: CGPoint) -> CGPoint {
            return CGPoint(x: p.x + xOffset, y: p.y + yOffset)
        }
        
        let path = Path { path in
            path.move(to: adjustPoint(p: CGPoint(x: (size * 0.2), y: (size * 0.2))))
            path.addCurve(to: adjustPoint(p: CGPoint(x: (size * 0.8), y: (size * 0.8))),
                          control1: adjustPoint(p: CGPoint(x: (size * 0.4), y: (size * 0.2))),
                          control2: adjustPoint(p: CGPoint(x: (size * 0.6), y: (size * 0.4))))
            path.move(to: adjustPoint(p: CGPoint(x: (size * 0.2), y: (size * 0.8))))
            path.addCurve(to: adjustPoint(p: CGPoint(x: (size * 0.8), y: (size * 0.2))),
                          control1: adjustPoint(p: CGPoint(x: (size * 0.4), y: (size * 0.8))),
                          control2: adjustPoint(p: CGPoint(x: (size * 0.6), y: (size * 0.6))))
        }
        
        return path
    }
}
