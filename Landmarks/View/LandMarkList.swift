//
//  LandMarkList.swift
//  Landmarks
//
//  Created by Lucy on 19/08/22.
//

import SwiftUI

struct LandMarkList: View{
    var body: some View{
        NavigationView{
            List(landmarks){
                landmarks in
                
                NavigationLink{
                    LandMarkDetail(landMark: landmarks)
                } label: {
                    LandMarkRow(landmark: landmarks)
                }
            }
            .navigationTitle("Land Marks")
        }
        
    }
}

struct LandmarkList_Preview: PreviewProvider{
    static var previews: some View{
        LandMarkList()
    }
}
