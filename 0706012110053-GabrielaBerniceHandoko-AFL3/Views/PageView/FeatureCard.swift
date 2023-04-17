//
//  FeatureCard.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark

    var body: some View {
        // displays the landmark's featured image
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
        
            // giving overlay for the landmark infos
            .overlay{
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View{
    var landmark: Landmark
    
    var gradient: LinearGradient{
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    // for the overlay, giving the name of the landmark and the park
    var body: some View{
        ZStack(alignment: .bottomLeading){
            gradient
            VStack(alignment: .leading){
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
