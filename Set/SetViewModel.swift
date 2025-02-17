//
//  SetViewModel.swift
//  Set
//
//  Created by joey levin on 2/12/25.
//
import SwiftUI

class SetViewModel: ObservableObject {
    typealias Card = SetModel.Card

    init() {
        let theme = ThemeChooser().themes.randomElement()!
        chosenTheme = theme
        model = SetModel()
        { (colorIndex, shapeIndex, numberIndex, shadingIndex) in
            return Card(color: theme.colorList[colorIndex], shape: theme.shapeList[shapeIndex], number: numberIndex+1, shading: shadingIndex, id: UUID().uuidString)
        }
        model.shuffle()
        print(model)
    }
    
    private var chosenTheme: ThemeChooser.Theme
    @Published private var model : SetModel
    
    var cards: Array<Card> {
        return Array(model.cards.prefix(model.cardCount))
    }
    
    var theme: ThemeChooser.Theme {
        self.chosenTheme
    }
    
    func newGame() {
        return
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func moreCards() {
        model.cardCount += 3
    }
}
