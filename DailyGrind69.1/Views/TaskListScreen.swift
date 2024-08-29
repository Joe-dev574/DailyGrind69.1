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
struct TaskListScreen: View {
   
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    @State private var addNewTask: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView {
                    LazyVStack {
                        ForEach(tasks) { task in
                            NavigationLink(destination: EditTaskView() ){
                                TaskRowView(task: task)
                            }
                        }
                        .onDelete(perform: deleteTasks)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        addNewTask = true
                        HapticManager.notification(type: .success)
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
        
        .sheet(isPresented: $addNewTask) {
            AddTaskScreen()
                .presentationDetents([.large])
        }
    }
    
    
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}
    
#Preview {
    
    return TaskListScreen()
    
}
    

