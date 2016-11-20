//
//  SignUpViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/20/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialView = mainStoryboard.instantiateInitialViewController()
        
        present(initialView!, animated: true, completion: nil)
    }
}
