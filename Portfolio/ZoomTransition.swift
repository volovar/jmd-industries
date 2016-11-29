//
//  ZoomTransition.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class ZoomTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let homeViewController = fromViewController as! PortfolioHomeViewController
        let homeImageView = homeViewController.portfolioSnapshot
//        let portfolioViewController = toViewController as! PortfolioViewController
        let newImageView = UIImageView(image: homeImageView?.image)
//        newImageView.alpha = 0
        homeViewController.view.addSubview(newImageView)
        
        print("inside presentTransition")
        
        UIView.animate(withDuration: duration, animations: {
//            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
