//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Lucy on 20/08/22.
//

import Foundation
import SwiftUI

struct ProfileHost: View{
    @Environment(\.editMode) var editMode
    @EnvironmentObject var markCore: MarkCore

    var body: some View{
        VStack(alignment: .leading, spacing: 20){
            HStack{
                
                if editMode?.wrappedValue == .active{
                    Button("Cancel", role: .cancel){
                        markCore.markState.draftProfile = markCore.markState.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: markCore.markState.draftProfile)
            } else{
                ProfileEditor(profile: $markCore.markState.draftProfile)
                    .onAppear{
                        markCore.markState.draftProfile =  markCore.markState.profile
                    }
                    .onDisappear{
                        markCore.markState.profile =  markCore.markState.draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Preview: PreviewProvider{
    static var previews: some View{
        ProfileHost()
            .environmentObject(MarkCore()   )
    }
}
