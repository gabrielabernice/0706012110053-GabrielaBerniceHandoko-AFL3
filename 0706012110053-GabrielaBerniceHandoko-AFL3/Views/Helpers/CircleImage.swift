//
//  CircleImage.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        // making the shape into circle and give stroke and shadow in it
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

// giving the image as tutlerock
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
