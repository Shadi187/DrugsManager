//
//  AddDrug.swift
//  Drugs
//
//  Created by boshFbt on 11/08/2023.
//

import SwiftUI
import PhotosUI

struct AddDrug: View {
    @EnvironmentObject var vm: MainViewModel
//    @State var selectedItems: [PhotosPickerItem] = []
    
    var body: some View {
        ZStack {
            Color.theme.main.ignoresSafeArea()
            VStack{
//                if let data = vm.selectedItemData, let uiImage = UIImage(data:data) {
//                    Image(uiImage: uiImage)
//                        .resizable()
//                }
                addPhoto
                addGenName
                addTradeName
                addDose
                addDesc
                    .padding(.bottom)
                RoundedButton(content: "Save")
                    .onTapGesture {
                        vm.addDrug()
                    }
            }
        }
    }
}

//struct AddDrug_Previews: PreviewProvider {
//    @StateObject var vm = MainViewModel()
//    static var previews: some View {
//        AddDrug()
//            .environmentObject(vm)
//    }
//}

extension AddDrug{
    var addGenName: some View {
        VStack {
            Text("Generic Name")
            TextField("GenericName", text: $vm.tGN)
                .padding()
                .frame(height: 50)
                .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.theme.main)
                            .shadow( color:Color.gray.opacity(0.50),
                                radius: 10)
                )
            .padding()
        }
//            .onChange(of: vm.newGenName){_ in
//                vm.checkIsCompleted()
//            }
            
            
            
    }
    var addTradeName: some View {
        VStack {
            Text("Trade Name")
            TextField("Trade Name", text: $vm.tTN)
                .padding()
                .frame(height: 50)
                .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.theme.main)
                            .shadow( color:Color.gray.opacity(0.50),
                                radius: 10)
                )
            .padding()
        }
//            .onChange(of: vm.newTradeName){_ in
//                vm.checkIsCompleted()
//            }
            
            
    }
    var addDose: some View {
        VStack {
            Text("Dose")
            TextField("Dose" , text:$vm.tD)
                .padding()
                .frame(height: 50)
                .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.theme.main)
                            .shadow( color:Color.gray.opacity(0.50),
                                radius: 10)
                )
            .padding()
        }
//            .onChange(of: vm.newDose){_ in
//                vm.checkIsCompleted()
//            }
            
            
    }
    var addDesc: some View {
        VStack {
            Text("Description")
            TextField("Description", text: $vm.tDesc)
                .padding()
                .frame(height: 50)
                .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.theme.main)
                            .shadow( color:Color.gray.opacity(0.50),
                                radius: 10)
                )
            .padding()
        }
//            .onChange(of: vm.newDescription){_ in
//                vm.checkIsCompleted()
//            }
    }
    
    var addPhoto: some View {
        VStack{
            PhotosPicker(selection:$vm.selectedItems ,maxSelectionCount: 1){
                Circle()
                    .frame(width:60,height:70)
            }
            .onChange(of:vm.selectedItems){newItem in
                    
                guard let item = vm.selectedItems.first else {
                    return
                }
                item.loadTransferable(type: Data.self){ result in
                    switch result{
                    case .success(let data):
                        if let data = data {
                            DispatchQueue.main.async {
                                self.vm.selectedItemData = data
                            }
                            
                                
                        } else {
                            print("DATA IS NIL!")
                        }
                    case .failure(let failure):
                       fatalError("\(failure)")
                    }
                }
                
//                vm.
            }
        }
    }
    
    
//    func changeIt(){
//        var image:Image = vm.selectedItem
//    }

}
