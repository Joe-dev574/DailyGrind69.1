//
//  TaskCardView.swift
//  DailyGrind69.1
//
//  Created by Joseph DeWeese on 8/28/24.
//

import SwiftUI

struct TaskRowView: View {
    @Bindable var task: Task
    /// Model Context
    @Environment(\.modelContext) private var context
    /// Direct TextField Binding Making SwiftData to Crash, Hope it will be rectified in the Further Releases!
    /// Workaround use separate @State Variable
    @State private var title: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            HStack{
                task.icon
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.black)
                Spacer()
                VStack{
                    Text(task.title)
                        .lineLimit(1)
                        .font(.title3)
                        .foregroundStyle(.primary)
                        .fontWeight(.bold)
                    Text(task.briefDescription)
                        .lineLimit(3)
                        .foregroundStyle(.colorGrey)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 14))
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    Label(task.dateAdded.format("dd-MMM-yy HH:mm a"), systemImage: "calendar")
                        .font(.caption)
                        .foregroundStyle(.black)
                }
                Spacer()
                Circle()
                    .fill(indicatorColor)
                    .frame(width: 14, height: 14)
                    .padding(5)
                    .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                    .overlay {
                        Circle()
                            .foregroundStyle(.clear)
                            .contentShape(.circle)
                            .frame(width: 45, height: 45)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    task.isComplete.toggle()
                                }
                            }
                    }
                
            }
            .fontWeight(.semibold)
            .padding(4)
        })
                .background{
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .fill(task.tintColor)
                        .shadow(color: .black, radius: 2)
                        
                }
//                    .onSubmit {
//                        /// If TaskTitle is Empty, Then Deleting the Task!
//                        /// You can remove this feature, if you don't want to delete the Task even after the TextField is Empty
//                        if title == "" {
//                            context.delete(task)
//                            try? context.save()
//                        }
//                    }
//                    .onChange(of: title, initial: false) { oldValue, newValue in
//                        task.title = newValue
//                    }
//                    .onAppear {
//                        if title.isEmpty {
//                            title = task.title
//                        }
//                    }
//                    .padding(10)
                    .contextMenu {
                        Button("Delete Task", role: .destructive) {
                            /// Deleting Task
                            /// For Context Menu Animation to Finish
                            /// If this causes any Bug, Remove it!
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                context.delete(task)
                                try? context.save()
                            }
                        }
                    }
        }
            

var indicatorColor: Color {
    if task.isComplete {
        return .black
    }
    return task.dateAdded.isSameHour ? .colorBlue : (task.dateAdded.isPast ? task.tintColor : .black)
}
}

#Preview {
    TaskListScreen()
}
