//
//  Core.swift
//  Landmarks
//
//  Created by Lucy on 19/08/22.
//

import Foundation

class MarkCore : ObservableObject {
    
    @Published var markState : MarkState = MarkState.initial
    
    init() {
        _handleFetch()
    }
    
    func onEvent(markEvent: MarkEvent){
        switch markEvent {
        case .fetchDataSource :
            _handleFetch()
        case .FavoriteEventButtonEvent(let index) :
            _handleFavoriteEvent(index: index)
        case .ShowFavoriteToggleEvent:
            _handleShowFavorite(show: markState.isFavoriteOnly)
        }
    }
    
    private func _handleFetch() {
        let landmarks: [LandMark] = LandMarkData.load()
        let hike: [Hike] = HikeData.load()
        
        markState = markState.copyWith(landmarks: landmarks, landmarksOld: landmarks, hikes: hike, isFavoriteOnly: false)
    }
    
    private func _handleFavoriteEvent(index: Int) {
        var update: [LandMark] = markState.landmarksOld
        
        update[index].isFavorite = !(markState.landmarksOld[index].isFavorite)
        
        markState = markState.copyWith(
            landmarks:  nil,
            landmarksOld: update,
            hikes: nil, isFavoriteOnly: nil
        )
        
        _handleShowFavorite(show: markState.isFavoriteOnly)
    }
    
    private func _handleShowFavorite(show : Bool) {
        let currentLandmarks : [LandMark] = markState.landmarksOld
        
        guard show else {
            markState = markState.copyWith(
                landmarks: currentLandmarks,
                isFavoriteOnly: false
            )
            return
        }
        
        markState = markState.copyWith(
            landmarks: currentLandmarks.filter { land in land.isFavorite },
            isFavoriteOnly: true
        )
    }
}
