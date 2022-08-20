//
//  LandMarkDetail.swift
//  Landmarks
//
//  Created by Lucy on 19/08/22.
//

import SwiftUI
import MapKit

struct LandMarkDetail: View{
    @EnvironmentObject var markCore: MarkCore
    
    let landMark: LandMark
    
    var landmarkIndex: Int{
        markCore.markState.landmarks.firstIndex(where: {$0.id == landMark.id})!
    }
    
    var body: some View{
        ScrollView{
            VStack{
                MapView(coordinate: landMark.locationCoordinate)
                    .frame(height: 300)
                
                CircleImage(image: landMark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading){
                    HStack{
                        Text(landMark.name)
                            .font(.title)
                        
                        FavoriteButton(
                            isSet: markCore.markState.landmarks[landmarkIndex].isFavorite,
                            onTap: { markCore.onEvent(markEvent: .FavoriteEventButtonEvent(index: landmarkIndex)) }
                        )
                    }
                    HStack{
                        Text(landMark.park)
                           
                        Spacer()
                        
                        Text(landMark.state)
                          
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About \(landMark.name)")
                        .font(.title2)
                    
                    Text(landMark.description)
                        .font(.subheadline)
                    
                }
                .padding()
            }
            .navigationTitle(landMark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LandMarkDetail_Preview: PreviewProvider{
    static var previews: some View{
        LandMarkDetail(landMark: MarkCore().markState.landmarks[0])
            .environmentObject(MarkCore())
    }
}
