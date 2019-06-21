//
//  UITableView.swift
//  Todo
//
//  Created by Manuel Leibetseder on 20.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(_ cell: UITableViewCell.Type) {
        self.register(UINib(nibName: "\(cell.self)", bundle: nil), forCellReuseIdentifier: "\(cell.self)")
    }
    
    func dequeue<T: UITableViewCell>(_ cell: T.Type, _ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
    }
    
    enum AnimationDirection {
        case up
        case down
        case left
        case right
    }
    
    
    func reload(with animationDirection: AnimationDirection) {
        self.reloadData()
        self.layoutIfNeeded()
        
        let cells = self.visibleCells
        var index = 0
        
        let tableHeight: CGFloat = self.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            switch animationDirection {
            case .up:
                cell.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
                
            case .down:
                cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                
            case .left:
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                
            case .right:
                cell.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
            }
            
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }
}
