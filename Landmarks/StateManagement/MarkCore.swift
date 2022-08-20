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
        onEvent(markEvent: .fetchDataSource)
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
        let landmarks : [LandMark] = LandMarkData.load()
        markState = markState.copyWith(landmarks: landmarks, isFavoriteOnly: false)
    }
    
    private func _handleFavoriteEvent(index: Int) {
        var update: [LandMark] = markState.landmarks
        
        update[index].isFavorite = !(markState.landmarks[index].isFavorite)
        
        markState = markState.copyWith(
            landmarks: update,
            isFavoriteOnly: nil
        )
    }
    
    private func _handleShowFavorite(show : Bool) {
        guard show else {
            _handleFetch()
            return
        }
        
        let currentLandmarks : [LandMark] = markState.landmarks
        markState = markState.copyWith(
            landmarks: currentLandmarks.filter { land in land.isFavorite },
            isFavoriteOnly: true
        )
    }
}
