//
//  Note.swift
//  DailyGrind69.1
//
//  Created by Joseph DeWeese on 8/28/24.
//

import Foundation
import SwiftData

@Model
class Note {
    var creationDate: Date = Date.now
    var text: String
    var page: String?
    
    init(text: String, page: String? = nil) {
        self.text = text
        self.page = page
    }
    
    var task: Task?
}

