//
//  DrugsApp.swift
//  Drugs
//
//  Created by boshFbt on 09/08/2023.
//

import SwiftUI

@main
struct DrugsApp: App {
    @StateObject private var vm = MainViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                MainView(vm:vm)
            }.environmentObject(vm)
            
        }
    }
}
