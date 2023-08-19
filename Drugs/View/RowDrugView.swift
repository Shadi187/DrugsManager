//
//  RowDrugView.swift
//  Drugs
//
//  Created by boshFbt on 10/08/2023.
//

import SwiftUI

struct RowDrugView: View {
    @StateObject var vm = RowDrug()
    let genName: String
    let trName: String
    let tURL:String
    
    init(genName:String, trName:String, tURL:String){
        self.genName = genName
        self.trName = trName
        self.tURL = tURL
        
    }
//    let trData:Data
//    @State var trPhoto: UIImage? = nil
    
//    init(genName: String, trName: String, trData: Data, trPhoto: UIImage? = nil) {
//        self.genName = genName
//        self.trName = trName
//        self.trData = trData
////        self.trPhoto = trPhoto
//        self.trPhoto = convertImage(data: trData)
//    }
    var body: some View {
        HStack(spacing:10){
            
//            Image(uiImage:getImage() == nil ? "defaultPhoto" : getImage())
//            Image(getImage() == nil ? name:"defaultImage" : getImage())
            if let img = getImage() {
                ImageView(img: img)
//                    adf
            }
                    
//            ImageView(img: getImage()!)
            
            

                
            VStack{
                Text("\(genName)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text("\(trName)")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black.grayscale(1.5) as? Color)
            }
            
            Spacer()
        }
        
    }
    
//    private func convertImage(data:Data) -> UIImage?{
//        let img:UIImage? = UIImage(data:data)
//        return img
//    }
    
    private func getImage() -> UIImage?{
        guard let image = vm.getImage(url: URL(string:tURL)!) else {return nil}
        return image
    }
    
}

//struct RowDrugView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowDrugView(genName: "", trName: "")
//    }
//}
