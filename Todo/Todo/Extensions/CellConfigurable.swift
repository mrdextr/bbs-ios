//
//  CellConfigurable.swift
//  Todo
//
//  Created by Manuel Leibetseder on 21.06.19.
//  Copyright © 2019 Manuel Leibetseder. All rights reserved.
//

import Foundation

protocol CellConfigurable {
    associatedtype T
    func configure(for object: T)
}
