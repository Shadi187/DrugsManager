//
//  EachDrugView.swift
//  Drugs
//
//  Created by boshFbt on 19/08/2023.
//

import SwiftUI

struct EachDrugView: View {
    @StateObject var vm = RowDrug()
//    let genName: String
//    let tradeName: String
//    let dose: String
//    let description: String
//    let url: String
    let drug:MedicationsEntity
    
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                if let img = getImage(){
                    Image(uiImage: img)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth:.infinity)
                            .padding(.bottom)
                    
                }
                Divider()
                    .frame(minHeight: 4)
                    .overlay(.teal)
                    .shadow(radius: 10)
                            
                VStack(alignment: .leading){
                    genNameSection
                    tradeNameSection
                    doseSection
                    Divider()
                    descriptionSection
                        
                }
            }
        }
    }
            
            
            
            
            
            
}
    


//struct EachDrugView_Previews: PreviewProvider {
//    static var previews: some View {
//        EachDrugView(genName: "Paracetamol", tradeName: "Panadol", dose: "123", description: "This is good Drug", url: "")
//    }
//}

extension EachDrugView{
//    var imageSection: some View {
//
//
//    }
    
    var genNameSection: some View {
        Text(drug.generic_name ?? "No Drug!!" )
               .font(.largeTitle)
               .foregroundColor(Color.theme.main)
               .bold()
               .padding()
           


    }
    
    var tradeNameSection: some View {
        Text(drug.trade_name ?? "No Drug!!")
                       .font(.title2)
                       .foregroundColor(Color.theme.main)
                       .padding()
        
    }
    
    var doseSection: some View {
        Text(drug.dose ?? "No Drug!!")
                       .font(.title3)
                       .foregroundColor(Color.theme.main)
                       .padding()
        
    }
    
    var descriptionSection: some View {
        Text(drug.drugDescription ?? "No Drug!!")
                .font(.headline)
                .foregroundColor(Color.theme.main)
                .padding()
        
    }
    
    func getImage() ->UIImage? {
        guard let image = vm.getImage(url: URL(string:drug.url!)!) else {return nil}
        return image
    }
}
