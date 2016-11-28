//
//  EditPortfolioViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class EditPortfolioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(isEditing)
        setupView()
    }
    
    func setupView() {
        // get a snapshot of the portfolio view and set it as an image
        let viewForImage = storyboard?.instantiateViewController(withIdentifier: "PortfolioViewController")
        
        let renderer = UIGraphicsImageRenderer(size: (viewForImage?.view.bounds.size)!)
        let image = renderer.image { ctx in
            viewForImage?.view.drawHierarchy(in: (viewForImage?.view.bounds)!, afterScreenUpdates: true)
        }
        
        portfolioSnapshot.image = image
    }

    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
