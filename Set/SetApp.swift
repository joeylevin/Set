//
//  SetApp.swift
//  Set
//
//  Created by joey levin on 2/12/25.
//

import SwiftUI

@main
struct SetApp: App {
    @StateObject var game =  SetViewModel()
    var body: some Scene {
        WindowGroup {
            SetGameView(viewModel: game)
        }
    }
}
