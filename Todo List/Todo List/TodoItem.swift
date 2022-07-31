//
//  TodoItem.swift
//  Todo List
//
//  Created by Mac User on 31/07/2022.
//

import Foundation

class TodoItem {
    var title: String
    var checked: Bool = false
    init (title: String) {
        self.title = title
    }
}
