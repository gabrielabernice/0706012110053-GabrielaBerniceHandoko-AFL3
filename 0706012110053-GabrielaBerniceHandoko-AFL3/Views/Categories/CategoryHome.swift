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
                ForEach(modelData.categories.keys.sorted(), id: \.self){key in
                    Text(key)
                }
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
