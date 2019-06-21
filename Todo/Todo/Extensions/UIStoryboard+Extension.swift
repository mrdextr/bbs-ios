//
//  UIStoryboard+Extension.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static func instantiate<T: UIViewController>(_ type: T.Type) -> UIViewController {
        return UIStoryboard(name: "\(T.self)", bundle: nil).instantiateInitialViewController()!
    }
}
