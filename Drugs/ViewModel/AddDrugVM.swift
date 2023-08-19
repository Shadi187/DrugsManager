////
////  AddDrugVM.swift
////  Drugs
////
////  Created by boshFbt on 11/08/2023.
////
//
//import Foundation
//import CoreData
//import Combine
//
//class AddDrugVM:ObservableObject{
////    @Published var tGN: String = ""
////    @Published var tTN: String = ""
////    @Published var tD: String = ""
////    @Published var tDesc: String = ""
////    @Published var MainViewModel().: [MedicationsEntity] = []
//    //    @Published var tGN: String = ""
//    @Published var newArray:[MedicationsEntity] = []
//    var cancellable = Set<AnyCancellable>()
//    
//    //     static var container:NSPersistentContainer {
//    //        let container = NSPersistentContainer(name:"DrugEntity")
//    //        container.loadPersistentStores{(description,error) in
//    //            if let error = error {
//    //                fatalError("UNABLE TO LOAD PERSISTENT DATA!")
//    //            }
//    //        }
//    //        return container
//    //    }
//    let container:NSPersistentContainer
//    
//    init(){
//        container = NSPersistentContainer(name: "Medications")
//        container.loadPersistentStores { (description, error) in
//            if let error = error {
//                print("ERROR WITH LOADING DATA \(error)")
//            }else{
//                print("SUCCESSFULLY LOADED! ")
//            }
//        }
//        
//         CoreDataManager().fetchData(array: newArray)
//        
//            }
//        
////    func addSubscriber(){
////        MainViewModel().$arrayOfDrugs
////            .sink { (returnedCoins) in
////
////            }
////    }
//    
////    func fetchDrugs(){
////            let request = NSFetchRequest<MedicationsEntity>(entityName:"MedicationsEntity")
////            do {
////                //            MainViewModel().arrayOfDrugs = try container.viewContext.fetch(request)
////                MainViewModel().arrayOfDrugs = try container.viewContext.fetch(request)
////            }catch let error {
////                print("ERROR IN LOADING THE DATA \(error)")
////            }
////        }
//        
//        ///Add Drug to the core data
//        func addDrug(){
//            if tGN.count < 3 {return}
//            print("We reached there!!")
//            print(tGN)
//            let newDrug = MedicationsEntity(context: container.viewContext)
//            print("We reached after new drug!!")
//            newDrug.generic_name = tGN
//            print("We reached after new genericname drug!!")
//            newDrug.trade_name = tTN
//            print("We reached after new tradename drug!!")
//            newDrug.dose = tD
//            print("We reached after new dose drug!!")
//            newDrug.drugDescription = tDesc
//            print("We reached after new description drug!!")
//            //        MainViewModel().arrayOfDrugs.append(newDrug)
//            newArray.append(newDrug)
//            saveData()
//            emptyInputs()
//        }
//        
//        func emptyInputs(){
//            tGN = ""
//            tTN = ""
//            tD = ""
//            tDesc = ""
//            //        newCode = ""
//            //        isAdded = false
//            //        isEdit = false
//        }
//        
//        func saveData(){
//            do{
//                try container.viewContext.save()
////                newArray = CoreDataManager().fetchData()
//                CoreDataManager().fetchData(array: newArray)
//            }catch let error{
//                print("ERROR IN SAVING \(error)")
//            }
//        }
//        
//        func deleteDrug(indexSet:IndexSet) {
//            guard let index = indexSet.first else{return}
//            //        let entity = MainViewModel().arrayOfDrugs[index]
//            let entity = MainViewModel().arrayOfDrugs[index]
//            container.viewContext.delete(entity)
//            saveData()
//        }
//        
//        
//        func updateDrug(drug:MedicationsEntity) {
//            //        drug.genericName = newGenericName
//            //        drug.tradeName = newTradeName
//            //        drug.dose = newDose
//            //        drug.drugCode = newCode
//            //        drug.drugDescription = newDescription
//            
//            saveData()
//            emptyInputs()
//            //        isEdit = true
//        }
//        
//    }
//
