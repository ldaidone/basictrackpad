//
//  Extensions.swift
//  Basic Trackpad
//
//  Created by Tomasz Pieczykolan on 17/12/16.
//  Copyright © 2016 Tomasz Pieczykolan. All rights reserved.
//

import UIKit

extension CGPoint {
    var vector: CGVector {
        return CGVector(dx: self.x, dy: self.y)
    }
}
