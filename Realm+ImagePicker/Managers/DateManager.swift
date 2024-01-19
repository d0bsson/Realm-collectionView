//
//  DateManager.swift
//  Realm+ImagePicker
//
//  Created by d0bsson on 16.01.2024.
//

import Foundation

class DateManager {
    static let shared = DateManager()
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        let formattedDate = dateFormatter.string(from: Date())
        return formattedDate
    }
    
    private init() {}
}
