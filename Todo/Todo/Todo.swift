//
//  Todo.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation

struct Todo: Equatable, Codable {
    var done: Bool
    let title: String
    
    static var mockData: [Todo] = Todo.mock()

    private static func mock() -> [Todo] {
        return [
            Todo(done: false, title: "Drink Water"),
            Todo(done: false, title: "Plan Holiday"),
            Todo(done: true, title: "Wake up on time"),
            Todo(done: false, title: "Go to bed early"),
            Todo(done: true, title: "Wear short Trousers"),
            Todo(done: false, title: "Sleep for 8 Hours"),
            Todo(done: true, title: "Show up to Workshop")
        ]
    }
}

protocol TodoDelegate: class {
    func addNew(_ todo: String)
}


