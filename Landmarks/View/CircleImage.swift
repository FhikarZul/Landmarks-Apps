//
//  CircleImage.swift
//  Landmarks
//
//  Created by Lucy on 18/08/22.
//

import SwiftUI

struct CircleImage : View{
    var image: Image
    
    var body: some View{
        Image("turtlerock")
            .resizable()
            .clipShape(Circle())
            .frame(width: 250, height: 250)
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Preview: PreviewProvider{
   static var previews: some View{
        CircleImage(image: Image("turtlerock"))
    }
}
