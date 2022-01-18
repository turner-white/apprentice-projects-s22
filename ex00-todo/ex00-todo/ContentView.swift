//
//  ContentView.swift
//  p00-todo
//
//  Created by Samuel Shi on 1/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var todoLists: [TodoList] = []
    @State private var newListTitle: String = ""

    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        TextField("New List Title", text: $newListTitle)
                        Button("Create") {
                            todoLists.append(TodoList(title: newListTitle, todos: []))
                            newListTitle = ""
                        }
                    }
                }

                Section("Your Lists") {
                    if todoLists.isEmpty {
                        Text("No todo items yet...")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }

                    ForEach($todoLists, id: \.id) { $list in
                        NavigationLink(destination: TodoListView(list: $list)) {
                            Text(list.title)
                        }
                    }
                }
            }
            .navigationTitle("ToDoozie")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
