//
//  ProfileEditor.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List{
            HStack{
                Text("Username").bold()
                Divider()
                
                // adding text field which is filled with username
                TextField("Username", text: $profile.username)
            }
            
            // add toggle that can be switched on and off based on their wants of getting notification
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20){
                Text("Seasonal Photo").bold()
                
                // picker that can be used to select the profile seasonal photo, with the segmented style
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto){
                    ForEach(Profile.Season.allCases){ season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            // to pick date
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date){
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
