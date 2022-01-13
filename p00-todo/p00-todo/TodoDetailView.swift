//
//  TodoDetailView.swift
//  p00-todo
//
//  Created by Samuel Shi on 1/10/22.
//

import SwiftUI

struct TodoDetailView: View {
    @Binding var todo: Todo

    var body: some View {
        HStack {
            Button(action: {
                todo.isCompleted.toggle()
            }, label: {
                let imageName = todo.isCompleted ? "checkmark.circle.fill" : "circle"
                Image(systemName: imageName)
            })

            Text(todo.title)
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(.example))
    }
}
