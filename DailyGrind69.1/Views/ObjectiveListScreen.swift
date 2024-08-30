//
//  TaskListScreen.swift
//  DailyGrind69.1
//
//  Created by Joseph DeWeese on 8/28/24.
//

import SwiftUI
import SwiftData


enum SortOrder: String, Identifiable, CaseIterable {
    case status, title, briefDescription
    
    var id: Self {
        self
    }
}
struct ObjectiveListScreen: View {
   
    @Environment(\.modelContext) private var modelContext
    @Query private var objectives: [Objective]
    @State private var addNewObjective: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
              
                ScrollView(.vertical) {
                    LazyVStack(spacing:10) {
                        ForEach(objectives) { objective in
                            NavigationLink(destination: EditTaskView() ){
                                TaskRowView(objective: objective)   .strikethrough(objective.isComplete, pattern: .solid, color: .black)
                            }
                        }
                        .onDelete(perform: deleteTasks)
                    }
                }.scrollIndicators(.hidden)
                    .frame(maxWidth: .infinity)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        addNewObjective = true
                        HapticManager.notification(type: .success)
                    }, label: {
                        Image(systemName: "plus")
                    })
                   
                }
                ToolbarItem(placement: .principal) {
                                       HeaderView()
                }
            }
        }
        
        .sheet(isPresented: $addNewObjective) {
            AddObjectiveScreen()
                .presentationDetents([.medium, .large])
        }
    }
    
    
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(objectives[index])
            }
        }
    }
}
    
#Preview {
    
    return ObjectiveListScreen()
    
}
    

