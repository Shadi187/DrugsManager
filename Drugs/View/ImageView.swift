//
//  ImageView.swift
//  Drugs
//
//  Created by boshFbt on 15/08/2023.
//

import SwiftUI

struct ImageView: View {
//    var image:String = "Paracetamol"
    var img:UIImage
    var body: some View {
        Image(uiImage: img)
            .resizable()
            .scaledToFit()
            .frame(width:70)
            .clipShape(Circle())
        
    }
}

//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView(image:"Paracetamol")
//    }
//}
