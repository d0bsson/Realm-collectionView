//
//  RealmManager.swift
//  Realm+ImagePicker
//
//  Created by d0bsson on 14.01.2024.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    func urlPath() -> URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL.applicationDirectory }
        print(path)
        return path
        
    }
    //MARK: - Здесь сохраняю изображения
    func saveImage(imageData: Data, name: String) {
        var path = urlPath()        
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
    
    //MARK: - Здесь сохраняю имена для этих изображений в UserDefaults
    private let key = "nameImage"
    func saveNames(name: String) {
        var names = loadNames()
        names.append(name)
        UserDefaults.standard.setValue(names, forKey: key)
    }
    
    func loadNames() -> [String] {
        if let names = UserDefaults.standard.value(forKey: key) as? [String] {
            return names
        }
        return []
    }
}
