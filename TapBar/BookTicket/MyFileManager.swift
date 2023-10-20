//
//  FileManager.swift
//  TicketBooking
//
//  Created by Zhilin Pan on 10/19/23.
//

import Foundation
import UIKit

class MyFileManager {
    
    class func createFolder(named folderName: String) throws {
        let fileManager = FileManager.default
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let folderURL = documentsDirectory.appendingPathComponent(folderName)
//            print(folderURL)
            
            if !fileManager.fileExists(atPath: folderURL.path) {
                try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            }
        }
    }
    

    
    class func saveImage(_ image: UIImage, to folderName: String, with filename: String) throws {
        if let imageData = image.pngData() {
            try createFolder(named: folderName)
            
            let fileManager = FileManager.default
            if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                let folderURL = documentsDirectory.appendingPathComponent(folderName)
                let imageURL = folderURL.appendingPathComponent(filename)
                
                try imageData.write(to: imageURL)
            }
        }
    }
    
    // Other file management methods can be added here.
}

