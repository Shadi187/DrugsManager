////
////  CoreDataManager.swift
////  Drugs
////
////  Created by boshFbt on 11/08/2023.
////
//
//import Foundation
//import CoreData
//
//class CoreDataManager {
//    
//    let container:NSPersistentContainer
//    init(){
//        container = NSPersistentContainer(name:"Medications")
//        container.loadPersistentStores { (description,error) in
//            if let error {
//                print("ERROR")
//            }else{
//                print("nothing wrong")
//            }
//        }
//    }
//                      
//   static func fetchData(array:[MedicationsEntity]) -> [MedicationsEntity] {
//        let request = NSFetchRequest<MedicationsEntity>(entityName: "MedicationsEntity")
//        do{
////            var array = try container.viewContext.fetch(request)
//            var array = try container.viewContext.fetch(request)
//            print("successfully fetched data")
//            return array
//            
//        }catch let error{
//            print("ERROR IN LOADING THE DATA \(error)")
//            return []
//            
//        }
//    }
//    
//}
