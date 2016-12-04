//
//  ImageZoomTransition.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit



protocol LightBoxTransitionPresentDelegate {
    //func transitionFromViewController() -> UIViewController
    func imageViewForTapped() -> UIImageView
    //var transitionFromImageView: UIImageView {get}
}

protocol LightBoxTransitionDismissDelegate {
    //func transitionFromViewController() -> UIViewController
    func imageViewForTapped() -> UIImageView
    //var transitionFromImageView: UIImageView {get}
}

class LightBoxTransition: BaseTransition {
    
    let window = UIApplication.shared.keyWindow
    var originalSelectedImageViewFrame: CGRect!
    var originalTappedImageViewFrame: CGRect!
    var presentDelegate: LightBoxTransitionPresentDelegate?
    var dismissDelegate: LightBoxTransitionDismissDelegate?
    var blackView: UIView!
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {

        let lightBoxViewController = toViewController as! LightBoxViewController
        let tappedImageView = presentDelegate?.imageViewForTapped()
        
        let lightBoxImageView = dismissDelegate?.imageViewForTapped()
        
        
        
        
        
        
        originalSelectedImageViewFrame = tappedImageView!.frame
        
        
        tappedImageView!.isHidden = true
        
        //create lightBoxBG
        blackView = UIView(frame: lightBoxViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0
        containerView.addSubview(blackView)
        
        
        // creating window
        
        var movingImage = UIImageView(frame: originalSelectedImageViewFrame)
        movingImage.contentMode = UIViewContentMode.scaleAspectFit
        movingImage.clipsToBounds = tappedImageView!.clipsToBounds
        movingImage.image =  tappedImageView!.image
        let window = UIApplication.shared.keyWindow
        window?.addSubview(movingImage)
        
        
        
//        lightBoxImageView?.isHidden = true
        containerView.addSubview((lightBoxViewController.view)!)
        lightBoxViewController.view.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            
            movingImage.frame = (lightBoxImageView?.frame.offsetBy(dx: 0, dy: 52))!

            tappedImageView?.isHidden = true
            tappedImageView?.alpha = 1
            self.blackView.alpha = 1
            
            
 
            
            
        }) { (finished: Bool) -> Void in
            lightBoxViewController.view.alpha = 1

            movingImage.contentMode = (lightBoxImageView?.contentMode)!
            
            movingImage.clipsToBounds = lightBoxImageView!.clipsToBounds
            
            movingImage.removeFromSuperview()
            self.blackView.removeFromSuperview()
            lightBoxImageView?.isHidden = false
            tappedImageView?.isHidden = true
            self.finish()
            
        }

        
        
        
        
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        
        let lightBoxViewController = fromViewController as! LightBoxViewController
        let tempViewController = toViewController as! PortfolioTempViewController
       
        
        
        let tappedImageView = presentDelegate?.imageViewForTapped()
        let lightBoxImageView = dismissDelegate?.imageViewForTapped()
        
        originalTappedImageViewFrame = lightBoxImageView!.frame
        
        tappedImageView!.isHidden = true
        
        
        
        // creating window
        
        let movingImage = UIImageView(frame: (lightBoxImageView?.frame.offsetBy(dx: 0, dy: 52))!)
        movingImage.contentMode = UIViewContentMode.scaleAspectFill
        movingImage.clipsToBounds = lightBoxImageView!.clipsToBounds
        movingImage.image =  lightBoxImageView!.image
        let window = UIApplication.shared.keyWindow
        window?.addSubview(movingImage)
        
        
        blackView = UIView(frame: lightBoxViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0
        containerView.addSubview(blackView)
        self.blackView.alpha = 0.6
        
        UIView.animate(withDuration: duration, animations: {
            tappedImageView?.isHidden = true
            lightBoxViewController.lightBoxBG.alpha = 0
            lightBoxViewController.view.isHidden = true
//            tappedPhotoViewController.actionsImage.alpha = 0
//            tappedPhotoViewController.doneButton.alpha = 0
            
            
            movingImage.frame = tappedImageView!.frame
            movingImage.contentMode = UIViewContentMode.scaleAspectFill
            
        }) { (finished: Bool) -> Void in
            movingImage.contentMode = UIViewContentMode.scaleAspectFit
            
            //            movingImage.contentMode = (tappedPhotoImageView?.contentMode)!
            movingImage.clipsToBounds = tappedImageView!.clipsToBounds
            
            movingImage.removeFromSuperview()
            self.blackView.removeFromSuperview()
            
            tappedImageView?.isHidden = false
            self.finish()
        }

        
        
        
        
        
    }
    
    
   
}
