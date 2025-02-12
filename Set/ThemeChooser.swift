//
//  ThemeChooser.swift
//  Set
//
//  Created by joey levin on 2/12/25.
//


//
//  Theme.swift
//  Memorize Theme Model
//
//  Created by joey levin on 2/6/25.
//

import Foundation
import SwiftUI

struct ThemeChooser {
 
    let themes: [Theme] = [
        Theme(key: "animals", name: "Animals", colorList: [.blue, .orange, .red], shapeList: ["diamond", "squiggle", "oval"]),
    ]

    struct Theme {
        let key: String
        let name: String
        let colorList: [Color]
        let shapeList: [String]
    }
        
}
