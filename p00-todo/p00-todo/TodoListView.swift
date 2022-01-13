//
//  TodoListView.swift
//  p00-todo
//
//  Created by Samuel Shi on 1/10/22.
//

import SwiftUI

struct TodoListView: View {
    @State private var newTodoTitle: String = ""

    // start with internal @State variable of type [Todo]
    @Binding var list: TodoList

    var body: some View {
        List {
            // start without binding, build creation flow, come back, add action, get error and then use binding
            Section {
                HStack {
                    TextField("New Todo Item", text: $newTodoTitle)
                    
                    Button(action: {
                        list.todos.append(Todo(title: newTodoTitle))
                        newTodoTitle = ""
                    }, label: {
                        Text("Add")
                    })
                }
            }
            
            Section("Todo Items") {
                if list.todos.isEmpty {
                    Text("No todo items yet...")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
                
                ForEach($list.todos, id: \.id, content: { $todo in
                    HStack {
                        Button(action: {
                            // 3) come back to this towards the end
                            todo.isCompleted.toggle()
                        }, label: {
                            // 2)
                            let imageName = todo.isCompleted ? "checkmark.circle.fill" : "circle"
                            Image(systemName: imageName)
                        })

                        // 1) do text before button
                        Text(todo.title)
                            .foregroundColor(todo.isCompleted ? .secondary : .primary)
                    }

                    // 4) Once completed, refactor to subview in TodoDetailView
                })
            }
        }
        .navigationTitle(list.title)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(list: .constant(.example))
    }
}
