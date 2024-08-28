//
//  HapticManager.swift
//  DailyGrind69.1
//
//  Created by Joseph DeWeese on 8/28/24.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}


