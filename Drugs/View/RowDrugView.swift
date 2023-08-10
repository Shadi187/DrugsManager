//
//  RowDrugView.swift
//  Drugs
//
//  Created by boshFbt on 10/08/2023.
//

import SwiftUI

struct RowDrugView: View {
    var body: some View {
        HStack(spacing:10){
        
            
            Circle()
                .frame(width:50)
            VStack{
                Text("paradontax")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("parax")
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
        RowDrugView()
    }
}
