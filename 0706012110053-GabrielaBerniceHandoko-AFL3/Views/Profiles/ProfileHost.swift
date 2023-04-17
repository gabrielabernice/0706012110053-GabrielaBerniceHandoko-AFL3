//
//  ProfileHost.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 15/04/23.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                
                // adding the cancel button, to cancel the edit the profile data
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel){
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                // toggles edit mode on and off
                EditButton()
            }
            
            // conditional, if on edit mode, then there will be showing the profile editor
            if editMode?.wrappedValue == .inactive{
                // read the data from environment, then passed the data to profile host
                ProfileSummary(profie: modelData.profile)
            }
            else{
                ProfileEditor(profile: $draftProfile)
                
                // it is used to change the profile data to a new data, so the new data will be changed when the user click on the done button
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
        // adding modifier so that the preview will not fail
            .environmentObject(ModelData())
    }
}
