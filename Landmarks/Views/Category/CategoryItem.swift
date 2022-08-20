//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Lucy on 20/08/22.
//

import SwiftUI

struct CategoryItem: View{
    var landMark: LandMark
    
    var body: some View{
        VStack(alignment: .leading){
            landMark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                
            Text(landMark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Preview: PreviewProvider{
    static var previews: some View{
        CategoryItem(landMark: MarkCore().markState.landmarksOld[0])
    }
}
