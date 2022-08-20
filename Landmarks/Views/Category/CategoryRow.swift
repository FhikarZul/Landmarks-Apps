//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Lucy on 20/08/22.
//

import SwiftUI

struct CategoryRow: View{
    var categoryName: String
    var item: [LandMark]
    
    var body: some View{
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(item){
                        landmark in
                        NavigationLink{
                            LandMarkDetail(landMark: landmark)
                        } label: {
                            CategoryItem(landMark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryView_Preview: PreviewProvider{
    static var previews: some View{
        let landMark = MarkCore().markState.landmarksOld
        
        CategoryRow(
            categoryName: landMark[0].category.rawValue,
            item: Array(landMark.prefix(3))
        )
            
    }
}
