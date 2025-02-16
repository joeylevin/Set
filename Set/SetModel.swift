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
    

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            return "\(id): \(color) \(shape) \(number) \(isMatched ? "matched" : "")"
        }
        
        init(isMatched: Bool = false, isSelected: Bool = true, color: Color, shape: String, number: Int, shading: Int, id: String) {
            self.isMatched = isMatched
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
        
        var isMatched = false
        var isSelected = true
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

