//
//  SetModel.swift
//  Set Model
//
//  Created by joey levin on 2/12/25.
//

import Foundation
import SwiftUI

struct SetModel {
    private(set) var cards: Array<Card>
    var cardCount: Int
    
    init(cardContentFactory: (Int, Int, Int, Int) -> Card) {
        cards = []
        cardCount = 12
        for colorIndex in 0..<3 {
            for shapeIndex in 0..<3 {
                for numberIndex in 0..<3 {
                    for shadingIndex in 0..<3 {
                        let content = cardContentFactory(colorIndex, shapeIndex, numberIndex, shadingIndex)
                        cards.append(content)
                    }
                }
            }
        }
    }
        
    mutating func shuffle() {
        cards.shuffle()
    }
    
    var getSelectedCards: [Int]? {
        get { cards.indices.filter { index in cards[index].isSelected } }
    }
    
    func matchFound(cardSet: [Card]) -> Bool {
        let validShape = validSet(item1: cardSet[0].shape, item2: cardSet[1].shape, item3: cardSet[2].shape)
        let validShading = validSet(item1: cardSet[0].shading, item2: cardSet[1].shading, item3: cardSet[2].shading)
        let validNumber = validSet(item1: cardSet[0].number, item2: cardSet[1].number, item3: cardSet[2].number)
        let validColor = validSet(item1: cardSet[0].color, item2: cardSet[1].color, item3: cardSet[2].color)
        return validShape && validShading && validNumber && validColor
    }
    
    func validSet<T: Equatable>(item1: T, item2: T, item3: T) -> Bool{
        return allDifferent(item1: item1, item2: item2, item3: item3) || allSame(item1: item1, item2: item2, item3: item3)
    }
    
    func allDifferent<T: Equatable>(item1: T, item2: T, item3: T) -> Bool{
        if item1 == item2 {
            return false
        }
        else if item2 == item3 {
            return false
        }
        else if item3 == item1 {
            return false
        }
        return true
    }
    
    func allSame<T: Equatable>(item1: T, item2: T, item3: T) -> Bool {
        if (item1 == item2) && (item2 == item3) {
            return true
        }
        else  {
            return false
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            let selectedCards = getSelectedCards
            print (selectedCards!)
            if var selected = selectedCards, selected.count >= 2 {
                if selected.count == 2 {
                    // 3 selected
                    selected.append(chosenIndex)
                    if matchFound(cardSet: [cards[selected[0]], cards[selected[1]], cards[selected[2]]]) {
                        // Match found
                        for i in 0...2 {
                            cards[selected[i]].isMatched = true
                        }
                    }
                    else {
                        for i in 0...2 {
                            cards[selected[i]].isMatched = false
                        }
                    }
                }
                else {
                    // starting new set
                    if cards[selected[0]].isMatched! {
                        for i in 0...2 {
                            cards.replace(from: cardCount, to: selected[i])
                        }
                    }
                    else {
                        for i in 0...2 {
                            cards[selected[i]].isMatched = nil
                            cards[selected[i]].isSelected = false
                        }
                    }
                }
            }
            cards[chosenIndex].isSelected = true
        }
    }
    

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            return "\(id): \(color) \(shape) \(number) \(isMatched ?? true ? "matched" : "")"
        }
        
        init(isSelected: Bool = false, color: Color, shape: String, number: Int, shading: Int, id: String) {
            self.isSelected = isSelected
            self.color = color
            self.shape = shape
            self.number = number
            self.shading = switch(shading) {
                case 0: Shading.empty
                case 1: Shading.solid
                default: Shading.transparent
            }
            self.id = id
        }
        
        var isMatched: Bool?
        var isSelected = false
        let color: Color
        let shape: String
        let number: Int
        let shading: Shading
        var id: String
        enum Shading {
            case empty
            case solid
            case transparent
        }
    }
    
    private struct Constants {
        let numberOfCards: Int = 81
    }
}

extension Array {
    mutating func replace(from source: Int, to destination: Int) -> Bool {
        guard source >= 0, source < count, destination >= 0, destination < count else {
            return false // Ensure indices are valid
        }
        self[destination] = self[source]
        remove(at: source)
        return true
    }
}
