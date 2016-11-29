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

    var zoomTransition: FadeTransition!
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTest" {
            // set up the transition
            zoomTransition = FadeTransition()
            segue.destination.modalPresentationStyle = .custom
            segue.destination.transitioningDelegate = zoomTransition
            zoomTransition.duration = 0.3
        }
    }
    
    @IBAction func didTapGreenButton(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "segueTest", sender: nil)
    }
}
