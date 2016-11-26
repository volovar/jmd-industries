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
    @IBOutlet weak var createButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        // text colors
        mainTitle.textColor = UIColor.white
        mainText.textColor = UIColor.white
        
        // button styling
        createButton.layer.cornerRadius = 5
        createButton.layer.borderWidth = 1
        createButton.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func didPressCreate(_ sender: Any) {
        let onboardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let initialView = onboardingStoryboard.instantiateInitialViewController()
        
        present(initialView!, animated: true, completion: nil)
    }
}
