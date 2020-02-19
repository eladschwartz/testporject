//
//  GFAlertVC.swift
//  HomeProject
//
//  Created by elad schwartz on 18/02/2020.
//  Copyright © 2020 elad schwartz. All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {

    @IBOutlet weak var titleLabel: GFTitleLabel!
    @IBOutlet weak var bodyLabel: GFBodyLabel!
    @IBOutlet weak var actionButton: GFButton!
    @IBOutlet weak var alertView: UIView!
    
    var titleText : String?
    var messageText : String?
    var buttonTitle : String?
    var buttonColor : UIColor? = .systemPink
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        alertView.layer.borderWidth = 2
        alertView.layer.borderColor = UIColor.white.cgColor
        alertView.layer.cornerRadius = 16
        alertView.backgroundColor = .systemBackground
       
        self.titleLabel.text = titleText
        self.titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.bodyLabel.text = messageText
        self.actionButton.setTitle(buttonTitle, for: .normal)
        self.actionButton.backgroundColor = buttonColor
        self.actionButton.tintColor = .white
    }
    @IBAction func btnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

