//
//  PortfolioHomeViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/22/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit
import QuartzCore
import RealmSwift

class PortfolioHomeViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var portfolioView: UIView!
    @IBOutlet weak var portfolio2View: UIView!
    @IBOutlet weak var portfolioSnapshot: UIImageView!
    @IBOutlet weak var portfolio2Snapshot: UIImageView!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var portfolioTitle: UILabel!
    
    var zoomTransition: ImageZoomTransition!
    var zoomTransition2: ImageZoomTransition2!
    var image: UIImage!
    var image2: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        // create button colors and borders
        createButton.layer.cornerRadius = 4
        createButton.layer.borderWidth = 4
        createButton.layer.borderColor = UIColor.init(patternImage: UIImage(named: "dash")!).cgColor
        
        portfolioSnapshot.layer.cornerRadius = 4
        portfolioSnapshot.layer.borderWidth = 0
        
        portfolio2Snapshot.layer.cornerRadius = 4
        portfolio2Snapshot.layer.borderWidth = 0
    
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
        
        portfolio2View.layer.shadowPath = UIBezierPath(rect: portfolioSnapshot.bounds).cgPath
        portfolio2View.layer.shadowColor = UIColor.black.cgColor
        portfolio2View.layer.shadowOpacity = 0.3
        portfolio2View.layer.shadowOffset = CGSize.zero
        portfolio2View.layer.shadowRadius = 4
        
        setupPortfolio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupPortfolio()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToView" {
            // set up the transition
            let destination = segue.destination
            zoomTransition = ImageZoomTransition()
            destination.modalPresentationStyle = .custom
            destination.transitioningDelegate = zoomTransition
            zoomTransition.duration = 0.35
        } else if segue.identifier == "segueToMyPortfolio" {
            // set up the transition
            let destination = segue.destination
            zoomTransition2 = ImageZoomTransition2()
            destination.modalPresentationStyle = .custom
            destination.transitioningDelegate = zoomTransition2
            zoomTransition2.duration = 0.35
        }
    }
    
    func setupPortfolio() {
        // set the title using our data
        portfolioTitle.text = userData.portfolios.first?.title
        
        // get a snapshot of the portfolio view and set it as an image
        let viewForImage = storyboard?.instantiateViewController(withIdentifier: "PortfolioViewController")
        
        let viewForImage2 = storyboard?.instantiateViewController(withIdentifier: "MyPortfolioViewController")
        
        let renderer = UIGraphicsImageRenderer(size: (viewForImage?.view.bounds.size)!)
        let renderer2 = UIGraphicsImageRenderer(size: (viewForImage2?.view.bounds.size)!)
        
        image = renderer.image { ctx in
            viewForImage?.view.drawHierarchy(in: (viewForImage?.view.bounds)!, afterScreenUpdates: true)
        }
        
        image2 = renderer2.image { ctx in
            viewForImage2?.view.drawHierarchy(in: (viewForImage2?.view.bounds)!, afterScreenUpdates: true)
        }
        
        portfolioSnapshot.image = image
        portfolio2Snapshot.image = image
    }
    
    @IBAction func didTapPortfolioImage(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "segueToView", sender: nil)
    }
    
    @IBAction func didTapMyPortfolioImage(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "segueToMyPortfolio", sender: nil)
    }
    
    @IBAction func didTapEdit(_ sender: Any) {
        let editorStoryboard = UIStoryboard(name: "Editor", bundle: nil)
        let initialView = editorStoryboard.instantiateInitialViewController()
        
        present(initialView!, animated: true, completion: nil)
    }
}
