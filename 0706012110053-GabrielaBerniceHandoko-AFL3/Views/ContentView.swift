//
//  ContentView.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct ContentView: View {

    @State private var selection: Tab = .featured

    //to display featured list
    enum Tab {
        case featured
        case list
    }

    var body: some View {
        // to make two tabs below the screen
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            //display landmarklist
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
