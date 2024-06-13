//
//  extensions.swift
//  Insta
//
//  Created by Ahmad Ellashy on 12/06/2024.
//

import UIKit

extension UIView {
    var height : CGFloat {
        return frame.height
    }
    var width: CGFloat {
        return frame.width
    }
    var top: CGFloat {
        return frame.origin.y
    }
    var bottom: CGFloat {
        return top + height
    }
    var left: CGFloat {
        return frame.origin.x
    }
    var right: CGFloat {
        return left + width
    }
}


