//
//  AddController.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit
import FloatingPanel

class AddController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    
    weak var delegate: TodoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancel(_:)))
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.finished(_:)))
        cancel.tintColor = .bbsBlue
        done.tintColor = .bbsBlue
        
        self.navigationItem.setRightBarButton(done, animated: false)
        self.navigationItem.setLeftBarButton(cancel, animated: false)
        
        self.textfield.returnKeyType = .done
    }
    
    @objc func cancel(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func finished(_ sender: UIBarButtonItem) {
        if let text = self.textfield.text {
        }
    }
}

