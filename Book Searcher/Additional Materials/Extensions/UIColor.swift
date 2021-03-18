//
//  UIColor.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue) ?? .clear
    }
}
