//
//  ContentView.swift
//  Landmarks
//
//  Created by Lucy on 18/08/22.
//

import SwiftUI

enum Tab {
       case featured
       case list
   }

struct ContentView: View {
    @EnvironmentObject var markCore: MarkCore
    
    var body: some View{
        TabView(selection: $markCore.markState.selectionTab){
            CategoryHome()
                .tabItem{
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandMarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}
 
 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MarkCore())
    }
}
