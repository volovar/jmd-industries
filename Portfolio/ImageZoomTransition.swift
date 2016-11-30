//
//  ImageZoomTransition.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class ImageZoomTransition: BaseTransition {
    
    let window = UIApplication.shared.keyWindow
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let portfolioHomeViewController = fromViewController as! PortfolioHomeViewController
        let portfolioView = portfolioHomeViewController.portfolioView!
        let tempImageView = UIImageView()
        
        // setup temp image view
        tempImageView.image = portfolioHomeViewController.image
        tempImageView.contentMode = .scaleAspectFill
        tempImageView.clipsToBounds = true
        tempImageView.frame.size = portfolioView.frame.size
        tempImageView.frame.origin = portfolioView.frame.origin
        // add a shadow to the image view
        tempImageView.layer.shadowPath = UIBezierPath(rect: tempImageView.bounds).cgPath
        tempImageView.layer.shadowColor = UIColor.black.cgColor
        tempImageView.layer.shadowOpacity = 0.3
        tempImageView.layer.shadowOffset = CGSize.zero
        tempImageView.layer.shadowRadius = 4
        
        // add temp image view to window
        window?.addSubview(tempImageView)
        
        toViewController.view.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            tempImageView.frame.size = toViewController.view.frame.size
            tempImageView.frame.origin = toViewController.view.frame.origin
        }) { (finished: Bool) -> Void in
            tempImageView.removeFromSuperview()
            toViewController.view.alpha = 1
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let portfolioHomeViewController = toViewController as! PortfolioHomeViewController
        let portfolioView = portfolioHomeViewController.portfolioView!
        let tempImageView = UIImageView()
        
        // setup temp image view
        tempImageView.image = portfolioHomeViewController.image
        tempImageView.contentMode = .scaleAspectFill
        tempImageView.clipsToBounds = true
        tempImageView.frame.size = fromViewController.view.frame.size
        tempImageView.frame.origin = fromViewController.view.frame.origin
        // add a shadow to the image view
        tempImageView.layer.shadowPath = UIBezierPath(rect: tempImageView.bounds).cgPath
        tempImageView.layer.shadowColor = UIColor.black.cgColor
        tempImageView.layer.shadowOpacity = 0.3
        tempImageView.layer.shadowOffset = CGSize.zero
        tempImageView.layer.shadowRadius = 4
        
        // add temp image view to window
        window?.addSubview(tempImageView)
        
        fromViewController.view.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            tempImageView.frame.size = portfolioView.frame.size
            tempImageView.frame.origin = portfolioView.frame.origin
        }) { (finished: Bool) -> Void in
            UIView.animate(withDuration: 0.18, animations: {
                tempImageView.alpha = 0
            }, completion: { (complete: Bool) in
                tempImageView.removeFromSuperview()
            })
            
            self.finish()
        }
    }

}
