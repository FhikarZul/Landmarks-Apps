//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Lucy on 20/08/22.
//

import SwiftUI

struct ProfileEditor: View{
    @Binding var profile: Profile
    
    var body: some View{
        List{
            HStack{
                Text("Username")
                    .bold()
                
                Divider()
                
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enable Notification")
                    .bold()
            }
            
            VStack(alignment: .leading, spacing: 20){
                Text("Seasonal Photo")
                    .bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonPhoto){
                    ForEach(Profile.Season.allCases){ season in
                        Text(season.rawValue).tag(season)
                        
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate, in: dataRange, displayedComponents: .date){
                Text("Goal Date")
                    .bold()
            }
        }
    }
    
    var dataRange: ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max  =  Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
}

struct ProfileEditor_Preview: PreviewProvider{
    static var previews: some View{
        ProfileEditor(profile: .constant(.default))
    }
}
