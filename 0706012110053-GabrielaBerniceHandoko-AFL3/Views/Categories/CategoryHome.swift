//
//  CategoryHome.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct CategoryHome: View {
    // to access category
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView{
            // caling the categories name in the form of list
            List{
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self){key in
                    // to show call the category row to show the featured landmarks as well as the name
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                // to make the edge rounded and the image fit to the edges
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
            
            // to show toolbar in the upper part as a button, and directing it to showing profile in the form of toggle
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
