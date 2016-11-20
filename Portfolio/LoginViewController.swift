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
    
    @IBAction func didPressSignUp(_ sender: UIButton) {
        let onboardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let initialView = onboardingStoryboard.instantiateInitialViewController()
        
        present(initialView!, animated: true, completion: nil)
    }
}
