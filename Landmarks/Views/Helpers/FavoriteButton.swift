//
//  FovoriteButton.dart.swift
//  Landmarks
//
//  Created by Lucy on 19/08/22.
//

import SwiftUI

struct FavoriteButton: View{
    var isSet: Bool
    var onTap : () -> Void
    
    var body: some View{
        Button{
            onTap()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Preview: PreviewProvider{
    static var previews: some View{
        FavoriteButton(isSet: false, onTap: {})
    }
}

