//
//  SearchVC.swift
//  HomeProject
//
//  Created by elad schwartz on 18/02/2020.
//  Copyright © 2020 elad schwartz. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var nameTextField: GFTextField!
    var isUsernameEntered: Bool {
        return !nameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.nameTextField.delegate = self
        self.title = "Search"
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func getFollowersBtnTapped(_ sender: Any) {
       pushFollowersVC()
    }
    
    func pushFollowersVC() {
        guard isUsernameEntered else {
            presentGFalertOnMainThread(title: "Empty Username", message: "Please enter username. We need to know who to look for.", buttonTitle: "OK")
            return
        }
        
        self.performSegue(withIdentifier: "fromSearchToFollower", sender: self)
    }
}


extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersVC()
        return true
    }
}
