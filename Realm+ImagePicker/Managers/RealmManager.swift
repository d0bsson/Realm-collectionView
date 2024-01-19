//
//  RealmManager.swift
//  Realm+ImagePicker
//
//  Created by d0bsson on 16.01.2024.
//

import Foundation
import RealmSwift

class RealmManager {
    
    let realm = try! Realm()
    var images: [Image]?
    
    
    //CREATE(add)
    func addImage(image: Image) {
        try! realm.write {
            realm.add(image)
        }
        fetchImages()
    }
    //READ(fetch)
    func fetchImages() {
        let images = realm.objects(Image.self)
        self.images = Array(images)
    }
    //update
    func updateNote(id: String) {
        guard let image = realm.object(ofType: Image.self, forPrimaryKey: id) else { return }
        
        try! realm.write {
            image.date = DateManager.shared.getCurrentDate()
        }
        fetchImages()
    }
    //delete
    func deleteImage(id: String) {
        guard let image = realm.object(ofType: Image.self, forPrimaryKey: id) else { return }
        
        try! realm.write {
            realm.delete(image)
        }
        fetchImages()
    }
    
    
    init() {
        fetchImages()
    }
}
