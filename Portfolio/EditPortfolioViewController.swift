//
//  EditPortfolioViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class EditPortfolioViewController: UIViewController {
    @IBOutlet weak var portfolioTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        portfolioTitle.text = mainPortfolio.title
    }

    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
