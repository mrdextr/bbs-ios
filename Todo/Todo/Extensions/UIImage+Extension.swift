//
//  UIImage+Extension.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func inTint(_ color: UIColor) -> UIImage? {
        var image = self.withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(self.size, false, image.scale)
        color.set()
        image.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: image.size.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
