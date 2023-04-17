//
//  ProfileSummary.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 15/04/23.
//

import SwiftUI

struct ProfileSummary: View {
    var profie: Profile
    
    var body: some View {
        ScrollView{
            // showing the username, seasonal photos, and goal date
            VStack(alignment: .leading, spacing: 10){
                Text(profie.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications : \(profie.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos : \(profie.seasonalPhoto.rawValue)")
                Text("Goal Date : ") + Text(profie.goalDate, style: .date)
                
                // to give divider in between
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    // to show the badges and modify some
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    // to call the view from hike view
                    HikeView(hike: ModelData().hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profie: Profile.default)
    }
}
