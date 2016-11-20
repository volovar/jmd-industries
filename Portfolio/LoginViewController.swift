//
//  LoginViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/18/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didPressLogin(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialView = mainStoryboard.instantiateInitialViewController()
        
        present(initialView!, animated: true, completion: nil)
    }
}
