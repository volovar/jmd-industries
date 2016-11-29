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
    @IBOutlet weak var portfolioView: UIView!
    @IBOutlet weak var portfolioSnapshot: UIImageView!
    @IBOutlet weak var createButton: UIButton!
    
    var zoomTransition: FadeTransition!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        // text colors
        mainTitle.textColor = UIColor.white
        
        // create button colors and borders
        createButton.layer.cornerRadius = 4
        createButton.layer.borderWidth = 1
        createButton.layer.borderColor = UIColor.clear.cgColor
        
        portfolioSnapshot.layer.cornerRadius = 4
        portfolioSnapshot.layer.borderWidth = 0
        
        // add shadows
        createButton.layer.shadowPath = UIBezierPath(rect: createButton.bounds).cgPath
        createButton.layer.shadowColor = UIColor.black.cgColor
        createButton.layer.shadowOpacity = 0.3
        createButton.layer.shadowOffset = CGSize.zero
        createButton.layer.shadowRadius = 4
        createButton.layer.shouldRasterize = true
        
        portfolioView.layer.shadowPath = UIBezierPath(rect: portfolioSnapshot.bounds).cgPath
        portfolioView.layer.shadowColor = UIColor.black.cgColor
        portfolioView.layer.shadowOpacity = 0.3
        portfolioView.layer.shadowOffset = CGSize.zero
        portfolioView.layer.shadowRadius = 4
        
        
        // get a snapshot of the portfolio view and set it as an image
        let viewForImage = storyboard?.instantiateViewController(withIdentifier: "PortfolioViewController")
        
        let renderer = UIGraphicsImageRenderer(size: (viewForImage?.view.bounds.size)!)
        let image = renderer.image { ctx in
            viewForImage?.view.drawHierarchy(in: (viewForImage?.view.bounds)!, afterScreenUpdates: true)
        }
        
        portfolioSnapshot.image = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sequeToView" {
            // set up the transition
//            portfolioViewController = segue.destination as! PortfolioViewController
            zoomTransition = FadeTransition()
            segue.destination.modalPresentationStyle = .custom
            segue.destination.transitioningDelegate = zoomTransition
            zoomTransition.duration = 0.3
        }
    }
    
    @IBAction func didTapPortfolioImage(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "segueToView", sender: nil)
    }
}
