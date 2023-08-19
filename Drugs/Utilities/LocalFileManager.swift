//
//  LocalFileManager.swift
//  Drugs
//
//  Created by boshFbt on 15/08/2023.
//

import Foundation
import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    
    private init(){ }
    
//    func saveImage(data:Data, imageName:String, folderName:String) -> URL?{
////        Create folder if didn't yet (will run on the first time only)
//        createFolderIfNeeded(folderName: folderName)
//        print("FOLDER CREATED SUCCESSFULLY")
//        guard let url = getURLForImage(imageName: imageName, folderName: folderName) else {return nil}
//
//        do {
//            try data.write(to: url)
//            print("DATA CONVERTED SUCCESSFULLY")
//        }catch let error{
//            print("ERROR WITH SAVING THE DATA!! \(error)")
//        }
//        return url
//    }
//
    func saveImage(image:UIImage, imageName:String, folderName:String) -> URL?{
//        Create folder if didn't yet (will run on the first time only)
        createFolderIfNeeded(folderName: folderName)
        print("FOLDER CREATED SUCCESSFULLY")
        guard let url = getURLForImage(imageName: imageName, folderName: folderName) else {return nil}
        
        do {
            try image.pngData()?.write(to: url)
            print("DATA CONVERTED SUCCESSFULLY")
        }catch let error{
            print("ERROR WITH SAVING THE DATA!! \(error)")
            return nil
        }
        return url
    }
    
    func getImage(url:URL) -> UIImage? {
        var image = UIImage(contentsOfFile: url.path)
        return image
    }

//    func getImage(imageName:String, folderName:String) -> UIImage?{
//        guard
//            let url = getURLForImage(imageName: imageName, folderName: folderName),
//            FileManager.default.fileExists(atPath: url.path) else {
//            return nil
//        }
//        return UIImage(contentsOfFile: url.path)
//    }
    
    
    private func createFolderIfNeeded(folderName:String){
        guard let url = getURLForFolder(folderName: folderName) else {return}
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at:url,withIntermediateDirectories: true)
            }catch let error {
                print("ERROR IN CREATING THE FILE \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName:String) -> URL? {
        guard let url = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first else{
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    
    private func getURLForImage(imageName:String, folderName:String) ->URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return nil}
        return folderURL.appendingPathComponent("\(imageName)" + ".png")
    }
    
//    private func
}

/*
 
 1- send the data to this file and return it as uiimage
 2- take the uiimage and send it to here to put it inside a folder and name as the genericName+tradeName
 3- add string for the coreData to store the url for the photo
 4- add function for getting the image whenever the app run
 
 */

