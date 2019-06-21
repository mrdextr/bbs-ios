//
//  ListController+Panel.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import FloatingPanel
import UIKit

extension ListController: FloatingPanelControllerDelegate, TodoDelegate {
    
    func showPanel() {
        
        self.panel = FloatingPanelController()
        self.panel.delegate = self
        
        let navigation = UIStoryboard.instantiate(AddController.self) as? UINavigationController
        if let addController = navigation?.children[0] as? AddController {
            addController.delegate = self
        }
        
        self.panel.set(contentViewController: navigation)
        self.panel.isRemovalInteractionEnabled = true
        self.present(self.panel, animated: true, completion: nil)
    }
    
    func addNew(_ todo: String) {
        let todo = Todo(done: false, title: todo)
        self.persistancy.add(todo)
        self.tableView.reloadData()
    }
}
