//
//  PortfolioHomeViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/22/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class PortfolioHomeViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        // text colors
        mainTitle.textColor = UIColor.white
    }
}
