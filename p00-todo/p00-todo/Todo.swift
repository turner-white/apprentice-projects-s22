//
//  Todo.swift
//  p00-todo
//
//  Created by Samuel Shi on 1/10/22.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()

    var title: String
    var isCompleted: Bool = false
}

extension Todo {
    static var example: Todo {
        Todo(title: "Walk the dog")
    }
}
