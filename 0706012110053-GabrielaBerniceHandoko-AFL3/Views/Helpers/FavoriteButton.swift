//
//  FavoriteButton.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    // if it is favorite, therefore the star will be yellow, if not then it will be grey colored
    var body: some View {
        Button{
            isSet.toggle()
        }label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

// to show preview of the favorite button
struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
