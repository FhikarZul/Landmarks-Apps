//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Lucy on 20/08/22.
//

import SwiftUI

struct ProfileSummary: View{
    var profile: Profile
    @EnvironmentObject var markCore: MarkCore
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "ON" : "OFF")")
                Text("Seasonal Photos: \(profile.seasonPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView{
                        HStack{
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
                
                VStack(alignment: .leading){
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: markCore.markState.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Preview: PreviewProvider{
    static var previews: some View{
        ProfileSummary(profile: Profile.default)
            .environmentObject(MarkCore())
    }
}
