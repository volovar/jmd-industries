//
//  EmptyPortfolioHomeViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/22/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class EmptyPortfolioHomeViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        // text colors
        mainTitle.textColor = UIColor.white
        mainText.textColor = UIColor.white
    }

    @IBAction func didPressCreate(_ sender: Any) {
        let onboardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let initialView = onboardingStoryboard.instantiateInitialViewController()
        
        present(initialView!, animated: true, completion: nil)
    }
}
