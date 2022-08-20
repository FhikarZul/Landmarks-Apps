//
//  Profile.swift
//  Landmarks
//
//  Created by Lucy on 20/08/22.
//

import Foundation

struct Profile{
    var username: String
    var prefersNotifications = true
    var seasonPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "rex_gets")
    
    enum Season: String, CaseIterable, Identifiable{
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
