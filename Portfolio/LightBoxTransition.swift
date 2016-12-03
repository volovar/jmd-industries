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
        let tappedImageImageView = presentDelegate?.imageViewForTapped()
        
        let lightBoxImageView = dismissDelegate?.imageViewForTapped()
        
        
        
        
        
        
        
        
        
//        originalSelectedImageViewFrame = tappedImageImageView!.frame.offsetBy(dx: 0, dy: 126)
        
        
        //create lightBoxBG
        blackView = UIView(frame: (tappedImageImageView?.frame)!)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0
        containerView.addSubview(blackView)
        
        
        // creating window
        
        let movingImage = UIImageView(frame: (tappedImageImageView?.frame)!) as! FlexibleAspectImageView
        movingImage.image =  tappedImageImageView?.image
//        movingImage.contentMode = UIViewContentMode.scaleAspectFill
        movingImage.setFlexibleAspectFill()
        movingImage.clipsToBounds = (tappedImageImageView?.clipsToBounds)!
        
        let window = UIApplication.shared.keyWindow
        window?.addSubview(movingImage)
        
        
        
        
        containerView.addSubview((lightBoxViewController.view)!)
        lightBoxViewController.view.isHidden = true
        UIView.animate(withDuration: duration, animations: {
            tappedImageImageView?.isHidden = true
            lightBoxImageView?.isHidden = true
            self.blackView.alpha = 1
            let movingImage = UIImageView(frame: (lightBoxImageView?.frame)!) as! FlexibleAspectImageView
      
            movingImage.setFlexibleAspectFit()
            //            movingImage.contentMode = UIViewContentMode.scaleAspectFit

            lightBoxViewController.view.isHidden = false

            
        }) { (finished: Bool) -> Void in
            
            
            self.blackView.removeFromSuperview()
            movingImage.removeFromSuperview()
            lightBoxImageView?.isHidden = false
            self.finish()
        }
        
        
        
        
        
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        let lightBoxViewController = fromViewController as! LightBoxViewController
        let tempViewController = toViewController as! PortfolioTempViewController
       
        
        
        let tappedImageImageView = presentDelegate?.imageViewForTapped()
        let lightBoxImageView = dismissDelegate?.imageViewForTapped()

//        
//        originalTappedImageViewFrame = tappedPhotoImageView!.frame.offsetBy(dx: 0, dy: 52)
//        
        
        
        
        // creating window
        
        let movingImage = UIImageView(frame: (lightBoxImageView?.frame)!) as! FlexibleAspectImageView
       
//        movingImage.contentMode = UIViewContentMode.scaleAspectFit
//        movingImage.clipsToBounds = lightBoxImageView!.clipsToBounds
        movingImage.setFlexibleAspectFit()
        movingImage.image =  lightBoxImageView!.image
        let window = UIApplication.shared.keyWindow
        window?.addSubview(movingImage)
        
        
        blackView = UIView(frame: lightBoxViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0
        containerView.addSubview(blackView)
        self.blackView.alpha = 0.6
        
        UIView.animate(withDuration: duration, animations: {
            tappedImageImageView?.isHidden = true

            lightBoxImageView?.isHidden = false
            self.blackView.alpha = 0
            lightBoxViewController.lightBoxBG.alpha = 0
//            lightBoxViewController.actionsImage.alpha = 0
//            lightBoxViewController.doneButton.alpha = 0
            
//            .offsetBy(dx: 0, dy: 126)
            movingImage.frame = tappedImageImageView!.frame
//            movingImage.contentMode = (tappedImageImageView?.contentMode)!
            movingImage.setFlexibleAspectFit()
            
            
        }) { (finished: Bool) -> Void in
            movingImage.contentMode = UIViewContentMode.scaleAspectFit
            movingImage.clipsToBounds = lightBoxImageView!.clipsToBounds
            movingImage.removeFromSuperview()
            self.blackView.removeFromSuperview()
            lightBoxImageView?.isHidden = true
            tappedImageImageView?.isHidden = false
            

            self.finish()
        }
        
        
        
        
        
    }
    
    
   
}
