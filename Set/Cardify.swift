//
//  Cardify.swift
//  Set
//
//  Created by joey levin on 2/16/25.
//

import SwiftUI

struct Cardify: ViewModifier {
    let color: Color
    let shading: String
    let amount: Int

    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let cardPadding: CGFloat = 5
    }
}

extension View {
    func cardify(color: Color, shading: String, amount: Int) -> some View {
        modifier(Cardify(color: color, shading: shading, amount: amount ))
    }
}
