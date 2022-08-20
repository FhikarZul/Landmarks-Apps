//
//  State.swift
//  Landmarks
//
//  Created by Lucy on 19/08/22.
//

import Foundation

struct MarkState {
    let landmarks: [LandMark]
    let hikes: [Hike]
    var isFavoriteOnly: Bool
    
    static let `initial` = MarkState(landmarks: [], hikes: [],isFavoriteOnly: false)
    
    func copyWith(landmarks: [LandMark]? = nil, hikes: [Hike]? = nil, isFavoriteOnly: Bool? = nil) -> MarkState {
        MarkState(
            landmarks: landmarks ?? self.landmarks,
            hikes: hikes ?? self.hikes
            isFavoriteOnly: isFavoriteOnly ?? self.isFavoriteOnly
        )
    }
}
