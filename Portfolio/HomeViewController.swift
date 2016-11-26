//
//  HomeViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/22/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//
import UIKit

var didCreatePortfolio: Bool = true

class HomeViewController: UIViewController {
    @IBOutlet weak var viewContainer: UIView!
    
    var emptyPortfolioView: UIViewController!
    var portfolioView: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        emptyPortfolioView = mainStoryboard.instantiateViewController(withIdentifier: "emptyPortfolioHomeView")
        portfolioView = mainStoryboard.instantiateViewController(withIdentifier: "portfolioHomeView")
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    func setupView() {
        if didCreatePortfolio == false {
            view.addSubview(emptyPortfolioView.view)
        } else {
            view.addSubview(portfolioView.view)
        }
    }
}
