//
//  AddDrug.swift
//  Drugs
//
//  Created by boshFbt on 11/08/2023.
//

import SwiftUI

struct AddDrug: View {
    @StateObject var vm = AddDrugVM()
    var body: some View {
        ZStack {
            Color.theme.main.ignoresSafeArea()
            VStack{
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

struct AddDrug_Previews: PreviewProvider {
    static var previews: some View {
        AddDrug()
    }
}

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
    
    

}
