//
//  LandMarkDetail.swift
//  Landmarks
//
//  Created by Lucy on 19/08/22.
//

import SwiftUI

struct LandMarkDetail: View{
    let landMark: LandMark
    
    var body: some View{
        ScrollView{
            VStack{
                MapView()
                    .frame(height: 300)
                
                CircleImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading){
                    Text(landMark.name)
                        .font(.title)
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
        }
    }
}

struct LandMarkDetail_Preview: PreviewProvider{
    static var previews: some View{
        LandMarkDetail(landMark: landmarks[0])
    }
}
