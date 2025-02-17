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
        Diamond(amount: card.number)
            .foregroundColor(card.color)
            .padding(Constants.shape.padding)
            .overlay(
                Text(card.shape)
                    .font(.system(size: 20))
                    .minimumScaleFactor(1)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
            )
            .cardify(card)
            
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        struct shape {
            static let padding: CGFloat = 10
        }
    }
    
}

#Preview {
    HStack {
        CardView(card: CardView.Card(color: Color.blue, shape: "circle", number: 3, shading: 1, id: "123"))
            .padding()
        CardView(card: CardView.Card(color: Color.blue, shape: "test", number: 2, shading: 2, id: "123"))
            .padding()
    }
}
