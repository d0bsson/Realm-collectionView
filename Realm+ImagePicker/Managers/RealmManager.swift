//
//  RealmManager.swift
//  Realm+ImagePicker
//
//  Created by d0bsson on 14.01.2024.
//

import Foundation

class RealmManager {
    
    func urlPath() -> URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL.applicationDirectory }
        print("Директория приложения найдена")
        return path
    }
    
    func saveImage(imageData: Data) {
        var path = urlPath()
        let name = "\(imageData.description).jpeg"
        
        path.append(path: name)
        do {
            try imageData.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadImage(fileName: String) -> Data {
        var path = urlPath()
        path.append(path: fileName)
        
        if let imageData = try? Data(contentsOf: path) {
            return  imageData
        } else {
            return Data()
        }
    }
}
