//
//  AddController+Textfield.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit
import FloatingPanel //

extension AddController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let panel = self.navigationController?.parent as? FloatingPanelController {
            panel.move(to: .full, animated: true) //
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let panel = self.navigationController?.parent as? FloatingPanelController {
            panel.move(to: .half, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let panel = self.navigationController?.parent as? FloatingPanelController {
            panel.move(to: .half, animated: true)
        }
        
        textfield.resignFirstResponder() //
        
        return true
    }
}

