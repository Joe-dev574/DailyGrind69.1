//
//  AddTaskScreen.swift
//  DailyGrind69.1
//
//  Created by Joseph DeWeese on 8/28/24.
//

import SwiftUI

struct AddObjectiveScreen: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var taskColor: String = "TaskColor 4"
    @State private var dateAdded: Date = .init()
    @State private var targetDate: Date = .init()
    @State private var title = ""
    @State private var briefDescription = ""
    var body: some View {
        NavigationStack {
            
            VStack{
                TextField("Give it a Name...", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(7.5))
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 15)
                    .padding(.top, 25)
                
                Text("Brief Description")
                TextEditor( text: $briefDescription)
                    .lineLimit(4)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 3))
                    .frame( height: 100)
                Divider()
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Select Target Date of Completion:")
                        .font(.title3)
                        .foregroundStyle(.gray)
                    
                    DatePicker("", selection: $targetDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                })
                /// Giving Some Space for tapping
                .padding()
                Divider()
                Text("Give it a Color...")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .padding()
                let colors: [String] = (1...11).compactMap { index -> String in
                    return "TaskColor \(index)"
                }
                
                HStack(spacing: 2) {
                    ForEach(colors, id: \.self) { color in
                        Circle()
                            .fill(Color(color))
                            .frame(width: 30, height: 30)
                            .background(content: {
                                Circle()
                                    .stroke(lineWidth: 4)
                                    .opacity(taskColor == color ? 1 : 0)
                            })
                            .hSpacing(.center)
                            .contentShape(.rect)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    taskColor = color
                                }
                            }
                    }
                }
                Spacer()
            }
            .padding()
            .toolbar{
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button("Save") {
                        let newTask = Objective(title: title, briefDescription: briefDescription, dateAdded: dateAdded,   tint: taskColor)
                        context.insert(newTask)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(title == "" || briefDescription == "")
                })
                ToolbarItem(placement: .topBarLeading, content: {
                    
                })
            }
        }
    }
}


#Preview {
    AddObjectiveScreen()
}
