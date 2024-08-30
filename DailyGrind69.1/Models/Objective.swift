//
//  Task.swift
//  DailyGrind69.1
//
//  Created by Joseph DeWeese on 8/28/24.
//

import SwiftUI
import SwiftData

@Model
final class Objective: Identifiable{
    var id: UUID
    var title: String
    var briefDescription: String
    var dateAdded: Date
    var dateStarted: Date
    var dateCompleted: Date
    var isComplete: Bool
    var tint: String
    var status: Status.RawValue
    @Relationship(inverse: \Focus.projects)
    var focusList: [Focus]?
    @Relationship(deleteRule: .cascade)
    var notes: [Note]?
    
    
    init(
        id: UUID = .init(),
        title: String,
        briefDescription: String,
        dateAdded: Date = Date.now,
        dateStarted: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        isComplete: Bool = false,
        tint: String,
        priority: Int? = nil,
        status: Status = .active
    ) {
        self.id = id
        self.title = title
        self.briefDescription = briefDescription
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.isComplete = isComplete
        self.tint = tint
        self.status = status.rawValue
    }
    var icon: Image {
        switch Status(rawValue: status)! {
        case .planning:
            Image(systemName: "calendar.badge.clock")
        case .active:
            Image(systemName: "hourglass.circle")
        case .completed:
            Image(systemName: "checkmark.seal")
        case .hold:
            Image(systemName: "exclamationmark.circle")
        }
    }
    var tintColor: Color {
        switch tint {
        case "TaskColor 1": return .taskColor1
        case "TaskColor 2": return .taskColor2
        case "TaskColor 3": return .taskColor3
        case "TaskColor 4": return .taskColor4
        case "TaskColor 5": return .taskColor5
        case "TaskColor 6": return .taskColor6
        case "TaskColor 7": return .taskColor7
        case "TaskColor 8": return .taskColor8
        case "TaskColor 9": return .taskColor9
        case "TaskColor 10": return .taskColor10
        case "TaskColor 11": return .taskColor11
        default: return .black
        }
    }
}
///TODO:  create custom icons for icon
enum Status: Int, Codable, Identifiable, CaseIterable {
    case planning,active, completed, hold
    var id: Self {
        self
    }
    var descr: String {
        switch self {
        case .planning:
            "Plan"
        case .active:
            "Active"
        case .completed:
            "Complete"
        case .hold:
            "Hold"
        }
    }
}

