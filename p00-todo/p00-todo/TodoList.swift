//
//  TodoList.swift
//  p00-todo
//
//  Created by Samuel Shi on 1/11/22.
//

import Foundation

struct TodoList: Identifiable {
    var id = UUID()

    var title: String
    var todos: [Todo]
}

extension TodoList {
    static var example: TodoList {
        TodoList(title: "My Day", todos: [
            Todo(title: "get ready for the day"),
            Todo(title: "walk to campus"),
            Todo(title: "go to physics"),
            Todo(title: "eat")
        ])
    }
}
