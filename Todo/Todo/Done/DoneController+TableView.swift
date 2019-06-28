//
//  DoneController+TableView.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit

extension DoneController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.donesis.count //
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(TodoCell.self, indexPath) //
        cell.configure(for: self.donesis[indexPath.row]) //
        
        return cell //
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        // needs fixing
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell //
        
        cell.setUnchecked() //
        cell.scale(with: 0.1, scale: 0.99) //
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            
            guard let todo = self?.donesis[indexPath.row] else { return }
            tableView.beginUpdates()
            self?.persistancy.set(done: false, for: todo)
            self?.refresh()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        // needs fixing
    }
}
