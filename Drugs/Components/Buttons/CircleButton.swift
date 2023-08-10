//
//  CircleButton.swift
//  Drugs
//
//  Created by boshFbt on 10/08/2023.
//

import SwiftUI

///Default Color1 is main and default Color2 is second
struct CircleButton: View {
    var color1:Color = Color(UIColor(red:0.7608050108,green:0.8164883852,blue:0.9259157777,alpha:1))
    var color2:Color = Color.theme.second
    var text:String = ""
    
    
    var body: some View {
        VStack {
            Circle()
                .frame(width:70)
                .foregroundColor(Color.theme.circle)
                .overlay(
                    Image(systemName: "pencil")
                        .font(.title)
                )
                
//                .shadow(color: Color(UIColor(red:0.7608050108,green:0.8164883852,blue:0.9259157777,alpha:1)),radius: 5,x:3,y:4)
//            .shadow(color: Color.white,radius: 20,x:-3,y:-4)
//                .shadow(color:.black,radius: 0)
        }
        
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton()
    }
}
