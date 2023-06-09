//
//  PageView.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // create custom view to present ui view controller representable view
            PageViewController(pages: pages, currentPage: $currentPage)
            // to show the correct value of the number of pages
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        
        // passing the required array of views
        PageView(pages: ModelData().features.map{FeatureCard(landmark: $0)})
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
