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
                
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandMark_Preview: PreviewProvider{
    static var previews: some View{
        LandMarkRow(landmark: landmarks[1]).previewLayout(.fixed(width: 400, height: 70))
    }
}
