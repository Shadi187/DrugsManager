//
//  AddDrugVM.swift
//  Drugs
//
//  Created by boshFbt on 11/08/2023.
//

import Foundation
import CoreData

class AddDrugVM:ObservableObject{
    @Published var tGN: String = ""
    @Published var tTN: String = ""
    @Published var tD: String = ""
    @Published var tDesc: String = ""
    @Published var tempArray: [DrugEntity1] = []
    //    @Published var tGN: String = ""
    
    
    //     static var container:NSPersistentContainer {
    //        let container = NSPersistentContainer(name:"DrugEntity")
    //        container.loadPersistentStores{(description,error) in
    //            if let error = error {
    //                fatalError("UNABLE TO LOAD PERSISTENT DATA!")
    //            }
    //        }
    //        return container
    //    }
    let container:NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Drug")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR WITH LOADING DATA \(error)")
            }
        }
        
        fetchDrugs()
            }
        
    func fetchDrugs(){
            let request = NSFetchRequest<DrugEntity1>(entityName:"DrugEntity1")
            do {
                //            MainViewModel().arrayOfDrugs = try container.viewContext.fetch(request)
                tempArray = try container.viewContext.fetch(request)
            }catch let error {
                print("ERROR IN LOADING THE DATA \(error)")
            }
        }
        
        ///Add Drug to the core data
        func addDrug(){
            if tGN.count < 3 {return}
            print("We reached there!!")
            print(tGN)
            let newDrug = DrugEntity1(context: container.viewContext)
            print("We reached after new drug!!")
            newDrug.generic_name = tGN
            newDrug.trade_name = tTN
            newDrug.dose = tD
            newDrug.ddescription = tDesc
            //        MainViewModel().arrayOfDrugs.append(newDrug)
            tempArray.append(newDrug)
            emptyInputs()
        }
        
        func emptyInputs(){
            tGN = ""
            tTN = ""
            tD = ""
            tDesc = ""
            //        newCode = ""
            //        isAdded = false
            //        isEdit = false
        }
        
        func saveData(){
            do{
                try container.viewContext.save()
                fetchDrugs()
            }catch let error{
                print("ERROR IN SAVING \(error)")
            }
        }
        
        func deleteDrug(indexSet:IndexSet) {
            guard let index = indexSet.first else{return}
            //        let entity = MainViewModel().arrayOfDrugs[index]
            let entity = tempArray[index]
            container.viewContext.delete(entity)
            saveData()
        }
        
        
        func updateDrug(drug:DrugEntity1) {
            //        drug.genericName = newGenericName
            //        drug.tradeName = newTradeName
            //        drug.dose = newDose
            //        drug.drugCode = newCode
            //        drug.drugDescription = newDescription
            
            saveData()
            emptyInputs()
            //        isEdit = true
        }
        
    }

