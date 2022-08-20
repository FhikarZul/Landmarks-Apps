//
//  State.swift
//  Landmarks
//
//  Created by Lucy on 19/08/22.
//

import Foundation

struct MarkState {
    let landmarksOld: [LandMark]
    let landmarks: [LandMark]
    let hikes: [Hike]
    var isFavoriteOnly: Bool
    var selectionTab: Tab
    var draftProfile = Profile.default
    var profile = Profile.default
    var showingProfile = false
    
    var categories: [String: [LandMark]]{
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }
    var features: [LandMark]{
        landmarks.filter {$0.isFeatured}
    }
    
    static let `initial` = MarkState(landmarksOld: [],
                                     landmarks: [],
                                     hikes: [],
                                     isFavoriteOnly: false,
                                     selectionTab: .featured
    )
    
    func copyWith(landmarks: [LandMark]? = nil,
                  landmarksOld: [LandMark]? = nil,
                  hikes: [Hike]? = nil,
                  isFavoriteOnly: Bool? = nil,
                  selectionTab: Tab? = nil
    ) -> MarkState {
        MarkState(
            landmarksOld: landmarksOld ?? self.landmarksOld,
            landmarks: landmarks ?? self.landmarks,
            hikes: hikes ?? self.hikes,
            isFavoriteOnly: isFavoriteOnly ?? self.isFavoriteOnly,
            selectionTab: selectionTab ?? self.selectionTab
        )
    }
}

