
import Foundation
import CoreData
import Combine
import SwiftUI
import PhotosUI

class MainViewModel:ObservableObject{
    //to save useranme persistently
    @Published var userName = UserDefaults.standard.string(forKey: "username")
    
    //check if the user has entered name
    @Published var hasEnteredName:Bool = false
    
    //to not show the entering name screen again
    @Published var userEnteredName = UserDefaults.standard.bool(forKey: "check")
    
    //store name
    @Published var tempName:String = ""
    
    //to show the sheet
    @Published var showAddDrug: Bool = false
    
    // array of drugs
    @Published var arrayOfDrugs:[MedicationsEntity] = []
    
    //variables for the temp values
    @Published var tGN: String = ""
    @Published var tTN: String = ""
    @Published var tD: String = ""
    @Published var tDesc: String = ""
    @Published var tPhoto: UIImage? = nil
    @Published var tURL:String = ""
    
    
    //to store the cancellables of the subscribers
    var cancellable = Set<AnyCancellable>()
    
    
    @Published var editMode:EditMode = .active
    @Published var isEditing:Bool = false
    
    
    @Published var selectedItems: [PhotosPickerItem] = []
    @Published var selectedItemsData: [Data] = []
//
//        @Published var selectedItem: PhotosPickerItem?
        @Published var selectedItemData: Data?
    private let fileManager = LocalFileManager.instance //singelton
    
    let container: NSPersistentContainer
    
    init(){
            container = NSPersistentContainer(name: "Medications")
        container.loadPersistentStores{(description,error) in
            if let error = error {
                print("ERROR IN LOADING THE DATABASE \(error)")
            }else{
                print("IT LOADED SUCCESSFULLY!!")
            }
            
        }
        fetchDrug()
        //showImages()
        
    }
    
//    func addSubscribers(){
//        $arrayOfDrugs
//
//    }
    
    
    func fetchDrug(){
        let request = NSFetchRequest<MedicationsEntity>(entityName: "MedicationsEntity")
        do{
            arrayOfDrugs = try  container.viewContext.fetch(request)
        } catch let error{
            print("ERROR IN FETCHING DATA \(error)")
        }
        
    }
    
//    func getDrug() -> UIImage? {
//        
//    }
    
    func donwloadImages(){
        var count = 0
        var maximum = arrayOfDrugs.count
        guard let url = arrayOfDrugs[count].url else {return}
        
    }
    
    func addDrug(){
//        fileManager.saveImage(image: , imageName: <#T##String#>, folderName: <#T##String#>)
        let imageName = "\(tGN)_\(tTN)"
        // converted to data Successfully
        // we should send it to the local file manager
        guard let selectedItemData else {return}
        tPhoto = UIImage(data: selectedItemData)
        var newDrug = MedicationsEntity(context: container.viewContext)
        newDrug.generic_name = tGN
        newDrug.trade_name = tTN
        newDrug.dose = tD
        newDrug.drugDescription = tDesc
        newDrug.url = tURL
        newDrug.url = fileManager.saveImage(image: tPhoto!, imageName: imageName, folderName: "Drugs_Folder")?.absoluteString
//        newDrug.
        arrayOfDrugs.append(newDrug)
        saveData()
        emptyInputs()
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchDrug()
        }catch let error{
            print("ERROR IN SAVING \(error)")
        }
    }
    
    func emptyInputs(){
        tGN = ""
        tTN = ""
        tD = ""
        tDesc = ""
        selectedItems.removeAll()
        selectedItemData = nil
        
    }
    
    func deleteDrug(indexSet:IndexSet){
        guard let index = indexSet.first else {return}
        let entity = arrayOfDrugs[index]
        container.viewContext.delete(entity)
        saveData()
    }
        
    func editIsOn(){
        isEditing.toggle()
        editMode = isEditing ? .active : .inactive
    }
    
    func moveDrug(from:IndexSet,to:Int){
        arrayOfDrugs.move(fromOffsets:from,toOffset: to)
    }
    
//    func convertImage(data:Data) -> UIImage?{
//        let uiImage = UIImage(data:data)
//        return uiImage
//    }
    
    
}
