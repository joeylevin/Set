//
//  CardView.swift
//  Set
//
//  Created by joey levin on 2/12/25.
//

import SwiftUI

struct CardView: View {
    typealias Card = SetModel.Card
    let card: Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(card.color))
                .overlay(
                    HStack {
                        ForEach(0..<card.number) { _ in
                            Text(card.shape)
                        }
                    }
                )
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
    
}

#Preview {
    HStack {
        CardView(card: CardView.Card(color: Color.blue, shape: "test", number: 5, shading: 1, id: "123"))
            .padding()
        CardView(card: CardView.Card(color: Color.blue, shape: "test", number: 5, shading: 2, id: "123"))
            .padding()
    }
}
