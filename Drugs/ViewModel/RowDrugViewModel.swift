//
//  RowDrugViewModel.swift
//  Drugs
//
//  Created by boshFbt on 18/08/2023.
//
import Foundation
import SwiftUI


class RowDrug:ObservableObject {
    var fileManager = LocalFileManager.instance
    
//    fileManager.getImage(imageName: <#T##String#>, folderName: <#T##String#>)
    
    func getImage(url:URL) -> UIImage? {
       let image = fileManager.getImage(url: url)
        return image 
    }
    
    
    
}
