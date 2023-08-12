//
//  RowDrugView.swift
//  Drugs
//
//  Created by boshFbt on 10/08/2023.
//

import SwiftUI

struct RowDrugView: View {
    let genName: String
    let trName: String
    
    var body: some View {
        HStack(spacing:10){
        
            
            Circle()
                .frame(width:50)
            VStack{
                Text("\(genName)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("\(trName)")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        
    }
}

struct RowDrugView_Previews: PreviewProvider {
    static var previews: some View {
        RowDrugView(genName: "", trName: "")
    }
}
