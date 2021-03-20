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
        titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.appColor(.myWhite)]
        largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.appColor(.myWhite)]
        barTintColor = UIColor.appColor(.myMainBackground)
        backgroundColor = .clear
        isTranslucent = false
        prefersLargeTitles = true
        setBackgroundImage(UIImage(), for: .default)
        backIndicatorImage = UIImage.appImage(.back)
        backIndicatorTransitionMaskImage = UIImage.appImage(.back)
        tintColor = UIColor.appColor(.myWhite)
    }
}
