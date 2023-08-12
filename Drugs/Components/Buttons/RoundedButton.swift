//
//  RoundedButton.swift
//  Drugs
//
//  Created by boshFbt on 11/08/2023.
//

import SwiftUI

struct RoundedButton: View {
    let content:String
    var body: some View {
        Text(content)
            .font(.title)
            .foregroundColor(Color.theme.second)
            .frame(width:90,height: 20)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .frame(width:180, height:50)
                    .shadow(color:Color.black, radius: 5,y:10)
                    .blur(radius: 2)
                
                
            )
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(content:"Save")
    }
}
