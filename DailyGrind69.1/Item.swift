//
//  Item.swift
//  DailyGrind69.1
//
//  Created by Joseph DeWeese on 8/28/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
