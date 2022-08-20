//
//  LandMarkList.swift
//  Landmarks
//
//  Created by Lucy on 19/08/22.
//

import SwiftUI

struct LandMarkList: View{
    @EnvironmentObject var markCore: MarkCore
    
    var body: some View{
        NavigationView{
            
            List(){
                Toggle(
                    "Favorite Only",
                    isOn: $markCore.markState.isFavoriteOnly
                )
                .onChange(of: markCore.markState.isFavoriteOnly) { value in
                    markCore.onEvent(markEvent: MarkEvent.ShowFavoriteToggleEvent)
                }
                
                ForEach(markCore.markState.landmarks){
                    landmarks in
                    
                    NavigationLink{
                        LandMarkDetail(landMark: landmarks)
                    } label: {
                        LandMarkRow(landmark: landmarks)
                    }
                }
            }
            .navigationTitle("Land Marks")
        }
        
    }
}

struct LandmarkList_Preview: PreviewProvider{
    static var previews: some View{
        ForEach(["iPhone 13 Pro", "iPhone 12 Pro"], id: \.self){
            deviceName in
            LandMarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
            
        }.environmentObject(MarkCore())
    }
}
