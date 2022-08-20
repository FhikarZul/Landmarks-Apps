//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Lucy on 18/08/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var markState = MarkCore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(markState)
        }
    }
}
