//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Lucy on 20/08/22.
//

import Foundation
import SwiftUI

struct CategoryHome: View{
    @EnvironmentObject var markCore: MarkCore
    
    var body: some View{
        NavigationView{
            List{
                markCore.markState.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(markCore.markState.categories.keys.sorted(), id: \.self){
                    key in
                    CategoryRow(categoryName: key, item: markCore.markState.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar(content: {
                Button{
                    markCore.markState.showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            })
            .sheet(isPresented: $markCore.markState.showingProfile) {
                ProfileHost()
                    .environmentObject(markCore)
            }
        }
        
    }
}

struct CategoryHome_Preview: PreviewProvider{
    static var previews: some View{
        CategoryHome()
            .environmentObject(MarkCore())
    }
}
