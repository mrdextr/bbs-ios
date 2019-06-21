//
//  UIView+Extension.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func scale(with duration: CGFloat = 0.1, scale factor: CGFloat = 1.0, completion: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(
                withDuration: 0.1,
                delay: 0,
                usingSpringWithDamping: 0.19,
                initialSpringVelocity: 5.5,
                options: .curveEaseInOut,
                animations: { [weak self] in
                    
                    self?.transform = CGAffineTransform(scaleX: factor, y: factor)
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.13) { [weak self] in
                self?.scale(with: duration, scale: 1)
            }
        }
    }
}
