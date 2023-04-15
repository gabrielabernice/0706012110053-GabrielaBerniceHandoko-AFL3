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
    
    var body: some View {
        NavigationView{
            // caling the categories name in the form of list
            List{
                // adding the image of the first featured landmark
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self){key in
                    // to show call the category row to show the featured landmarks as well as the name
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                // to make the edge rounded and the image fit to the edges
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
