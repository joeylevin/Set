//
//  SetGameView.swift
//  Set
//
//  Created by joey levin on 2/12/25.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel: SetViewModel
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            Text("Set").font(.largeTitle)
            cards
            Spacer()
            HStack {
                Button("New Game") {
                    viewModel.newGame()
                }
                Spacer()
                Button("Deal 3 More Cards") {
                    viewModel.moreCards()
                }
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card: card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(viewModel: SetViewModel())
    }
}
