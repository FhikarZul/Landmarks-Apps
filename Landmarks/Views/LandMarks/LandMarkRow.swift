//
//  LandMarkRow.swift
//  Landmarks
//
//  Created by Lucy on 18/08/22.
//

import SwiftUI

struct LandMarkRow: View{
    var landmark: LandMark
    
    var body: some View{
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.gray, radius: 2)
                
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct LandMark_Preview: PreviewProvider{
    static var previews: some View{
        LandMarkRow(landmark: MarkCore().markState.landmarks[0])
    }
}
