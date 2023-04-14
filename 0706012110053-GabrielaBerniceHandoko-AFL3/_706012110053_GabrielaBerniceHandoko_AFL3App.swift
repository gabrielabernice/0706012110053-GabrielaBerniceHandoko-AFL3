//
//  _706012110053_GabrielaBerniceHandoko_AFL3App.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
