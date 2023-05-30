//
//  OShape.swift
//  TicTacToe
//
//  Created by Eddington, Nick on 5/30/23.
//

import SwiftUI

struct OShape: Shape {
    func path(in rect: CGRect) -> Path {
        let size = min(rect.width, rect.height)
        let xOffset = (rect.width > rect.height) ? (rect.width - rect.height) / 2.0 : 0.0
        let yOffset = (rect.height > rect.width) ? (rect.height - rect.width) / 2.0 : 0.0
        
        func adjustPoint(x: Double, y:Double) -> CGPoint {
            return CGPoint(x: (x * size) + xOffset, y: (y * size) + yOffset)
        }
        
        let path = Path { path in
            path.move(to: adjustPoint(x: 0.62, y: 0.02))
            path.addCurve(to: adjustPoint(x: 0.04, y: 0.52),
                          control1: adjustPoint(x: 0.3, y: 0.02),
                          control2: adjustPoint(x: 0.1, y: 0.22))
            path.addCurve(to: adjustPoint(x: 0.50, y: 0.98),
                          control1: adjustPoint(x: 0.03, y: 0.70),
                          control2: adjustPoint(x: 0.04, y: 0.99))
            path.addCurve(to: adjustPoint(x: 0.75, y: 0.95),
                          control1: adjustPoint(x: 0.50, y: 0.98),
                          control2: adjustPoint(x: 0.65, y: 0.99))
            path.addCurve(to: adjustPoint(x: 0.95, y: 0.63),
                          control1: adjustPoint(x: 0.84, y: 0.90),
                          control2: adjustPoint(x: 0.93, y: 0.78))
            path.addCurve(to: adjustPoint(x: 0.5, y: 0.13),
                          control1: adjustPoint(x: 0.96, y: 0.43),
                          control2: adjustPoint(x: 0.8, y: 0.0))
            path.addCurve(to: adjustPoint(x: 0.4, y: 0.33),
                          control1: adjustPoint(x: 0.4, y: 0.18),
                          control2: adjustPoint(x: 0.35, y: 0.33))
            path.addCurve(to: adjustPoint(x: 0.7, y: 0.84),
                          control1: adjustPoint(x: 0.8, y: -0.10),
                          control2: adjustPoint(x: 0.99, y: 0.70))
            path.addCurve(to: adjustPoint(x: 0.22, y: 0.80),
                          control1: adjustPoint(x: 0.5, y: 0.92),
                          control2: adjustPoint(x: 0.4, y: 0.90))
            path.addCurve(to: adjustPoint(x: 0.30, y: 0.22),
                          control1: adjustPoint(x: -0.05, y: 0.50),
                          control2: adjustPoint(x: 0.30, y: 0.22))
            path.addCurve(to: adjustPoint(x: 0.62, y: 0.02),
                          control1: adjustPoint(x: 0.5, y: 0.05),
                          control2: adjustPoint(x: 0.80, y: 0.06))
            path.closeSubpath()
        }
        return path
    }
}

