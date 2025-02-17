//
//  Cardify.swift
//  Set
//
//  Created by joey levin on 2/16/25.
//

import SwiftUI

struct Cardify: ViewModifier {
    typealias Card = SetModel.Card
    let card: Card

    func body(content: Content) -> some View {
        let borderColor = card.isMatched.map { $0 ? Color.green : Color.red } ?? (card.isSelected ? Color.yellow : Color.black)
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base.strokeBorder(borderColor, lineWidth: Constants.lineWidth)
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
    func cardify(_ card: SetModel.Card) -> some View {
        modifier(Cardify(card: card))
    }
}
