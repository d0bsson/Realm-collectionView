//
//  Image.swift
//  Realm+ImagePicker
//
//  Created by d0bsson on 16.01.2024.
//

import Foundation
import RealmSwift

class Image: Object {
    
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var imageName = ""
    @Persisted var date = ""
}
