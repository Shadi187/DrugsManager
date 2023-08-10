//
//  AddName.swift
//  Drugs
//
//  Created by boshFbt on 10/08/2023.
//

import SwiftUI

struct AddName: View {
    @EnvironmentObject var vm:MainViewModel
    var body: some View {
        VStack{
            TextField("dasdsada", text: $vm.tempName)
            Button("press") {
                
                UserDefaults.standard.set(vm.tempName, forKey: "username")
                if vm.userName == nil {
                    Alert(title: Text("The name didn't save"))
                }else {
                    vm.hasEnteredName = true
                }
                    
                
                
            }
        }
        
    }
}

struct AddName_Previews: PreviewProvider {
    static var previews: some View {
        AddName()
        
    }
}
