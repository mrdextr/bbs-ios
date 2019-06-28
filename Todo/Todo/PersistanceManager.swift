//
//  PersistanceManager.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation


struct PersistanceManager {
    
    func save(_ todos: [Todo]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(todos), forKey: "Todos")
    }
    
    private func load() -> [Todo] {
        if let data = UserDefaults.standard.value(forKey: "Todos") as? Data,
           let todos = try? PropertyListDecoder().decode([Todo].self, from: data) {
            
            return todos
        }
        
        return []
    }
    
    func load(done: Bool, _ closure: ([Todo]) -> Void) {
        
        let todos = self.load()
        
        closure(                //
            done                //
          ? todos.checked       //
          : todos.unchecked     //
        )
    }
    
    func set(done: Bool, for object: Todo) {
        var todos = self.load()
        
        let index = todos.index(for: object)
        todos[index].done = done
        
        self.save(todos) //
        
        NotificationCenter.default.post(name: .reloadTodos, object: nil)
    }
    
    func add(_ todo: Todo) {
        var todos = self.load()
        todos.append(todo) //
        self.save(todos) //
        
        NotificationCenter.default.post(name: .reloadTodos, object: nil)
    }
}
