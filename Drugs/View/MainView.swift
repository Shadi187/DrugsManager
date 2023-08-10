//
//  MainView.swift
//  Drugs
//
//  Created by boshFbt on 09/08/2023.
//

import SwiftUI

struct ListBackgroundModifier: ViewModifier {

    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

struct MainView: View {
    @EnvironmentObject private var vm:MainViewModel
    @State var nameHasEntered: Bool = false
    var data = ["s","s","d","d"]
    var body: some View {
        ZStack{
            //Background Layer
            Color.theme.main.ignoresSafeArea()
            if !vm.hasEnteredName {
                AddName()
            }else {
                
            
            //Content Layer
            VStack{
                //The Navbar
                navbar
                
//                Show the drugs
                drugList
                Spacer()
            }
            
            
            
        }
    }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MainView()
        }.environmentObject(dev.mainVM)
    }
}


extension MainView {
    var navbar: some View {
        HStack{
            CircleButton()
            Spacer()
            VStack {
                
                Text("Welcome Back ")
                    
                Text("Dr. \(vm.hasEnteredName ? vm.userName! : "" )")
            }.foregroundColor(.gray)
            Spacer()
            CircleButton()
        }.padding()
    }
    
    var drugList:some View{
        List{
            ForEach(0..<10){data in
                    RowDrugView()
                    .listRowBackground(
                        Color.theme.main.ignoresSafeArea()
                    )
                    
            }
        }.listStyle(.plain)
        
        
        .modifier(ListBackgroundModifier())
        .scrollContentBackground(.hidden)
    }
    

}
