//
//  Array+Extension.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation

extension Array where Element == Todo {
    
    var checked: [Todo] {
        return self.filter { $0.done }
    }
    
    var unchecked: [Todo] {
        return self.filter { !$0.done }
    }
    
    func index(for object: Todo) -> Int {
        var i = 0
        for todo in self {
            if todo == object {
                break
            }
            
            i += 1
        }
        
        return i
    }
}
