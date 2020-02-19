//
//  UIViewController+Ext.swift
//  HomeProject
//
//  Created by elad schwartz on 18/02/2020.
//  Copyright © 2020 elad schwartz. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentGFalertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(nibName: "GFAlertVC", bundle: nil)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            alertVC.titleText = title
            alertVC.messageText = message
            alertVC.buttonTitle = buttonTitle
            self.present(alertVC, animated: true)
        }
    }
}
