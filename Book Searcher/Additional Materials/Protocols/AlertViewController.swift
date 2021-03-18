//
//  AlertViewController.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

protocol AlertViewController {
    func addErrorAlertView(error: (APIError, String?), completion: (() -> ())?)
    func showAlert(title: String, message: String, buttonAction: (()->())?)
    func showAlertWithTwoButtons(title: String, message: String, firstButtonText: String, firstButtonAction: (()->())?, secondButtonText: String, secondButtonAction: (()->())?)
}

extension AlertViewController where Self: UIViewController {
    func addErrorAlertView(error: (APIError, String?), completion: (() -> ())? = nil) {
        switch error.0 {
        case .requestFailed:
            showAlert(title: AlertViewTexts.noInternetConnecton.rawValue, message: AlertViewTexts.laterMessage.rawValue, buttonAction: completion)
        case .fromMessage:
            guard let message = error.1 else { return }
            showAlert(title: message, message: "", buttonAction: completion)
        default:
            showAlert(title: AlertViewTexts.errorMSG.rawValue, message: AlertViewTexts.laterMessage.rawValue, buttonAction: completion)
        }
    }
    
    func showAlert(title: String, message: String, buttonAction: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            buttonAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithTwoButtons(title: String, message: String, firstButtonText: String, firstButtonAction: (()->())? = nil, secondButtonText: String, secondButtonAction: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: firstButtonText, style: UIAlertAction.Style.default, handler: { (action) in
            firstButtonAction?()
        }))
        alert.addAction(UIAlertAction(title: secondButtonText, style: UIAlertAction.Style.default, handler: { (action) in
            secondButtonAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

