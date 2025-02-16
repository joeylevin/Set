//
//  Pie.swift
//  Set
//
//  Created by joey levin on 2/16/25.
//

import SwiftUI
import CoreGraphics

struct Diamond: Shape {
    var amount: Int = 1
    
    func path(in rect: CGRect) -> Path {
        let amount = CGFloat(amount)
        var p = Path()
        let side = min(rect.width, rect.height / (2*amount)) / 2
        let base = rect.midY - (amount - 1) * side

        for i in 0..<Int(amount) {
            let center = CGPoint(x: rect.midX, y: base+CGFloat(i+1)*2*side)
            let top = CGPoint( x: center.x, y: center.y + side )
            let bottom = CGPoint(x: center.x, y: center.y - side)
            let right = CGPoint( x: center.x + side, y: center.y )
            let left = CGPoint(x: center.x - side, y: center.y)
            p.move(to: top)
            p.addLine(to: right)
            p.addLine(to: bottom)
            p.addLine(to: left)
            p.addLine(to: top)
        }
        return p
    }
    
}


#Preview {
    HStack {
        Diamond()
            .padding()
        Diamond(amount: 2)
            .padding()
        Diamond(amount: 3)
            .padding()
    }
}
