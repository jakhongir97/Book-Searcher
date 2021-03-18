//
//  UINavigationBar.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

extension UINavigationBar {
    func opacityNavBar() {
        shadowImage = UIImage()
        titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.appColor(.myBlack)]
        barTintColor = UIColor.appColor(.mySecondBackground)
        backgroundColor = .clear
        isTranslucent = false
        setBackgroundImage(UIImage(), for: .default)
        backIndicatorImage = UIImage.appImage(.back)
        backIndicatorTransitionMaskImage = UIImage.appImage(.back)
        tintColor = UIColor.appColor(.myBlack)
    }
}
