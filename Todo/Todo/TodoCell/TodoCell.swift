//
//  TodoCell.swift
//  Todo
//
//  Created by Manuel Leibetseder on 20.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit

class TodoCell: UITableViewCell, CellConfigurable {
    
    typealias T = Todo
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.textLabel?.text = ""
        self.textLabel?.textColor = .bbsDarkGrey
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setup()
    }
    
    private func setup() {
        self.tintColor = .bbsBlue
    }
    
    func configure(for object: Todo) {
        if object.done {
            self.setChecked()
        } else {
            self.setUnchecked()
        }
        
        self.textLabel?.text = object.title
    }
    
    func setChecked() {
        self.accessoryType = .checkmark
        self.textLabel?.textColor = .bbsBlue
    }
    
    func setUnchecked() {
        self.accessoryType = .none
        self.textLabel?.textColor = .bbsDarkGrey
    }
}
