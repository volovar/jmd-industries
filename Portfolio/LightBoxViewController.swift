//
//  LightBoxViewController.swift
//  Iceberg
//
//  Created by user on 11/30/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class LightBoxViewController: UIViewController, LightBoxTransitionDismissDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var imageScrollVIew: UIScrollView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var lightBoxBG: UIView!
    @IBOutlet weak var lightBoxImageView: UIImageView!
    @IBOutlet weak var transitionToImageView: UIImageView!

    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    @IBOutlet weak var moreBUtton: UIButton!
    @IBOutlet weak var descrBoxArrow: UIButton!

    @IBOutlet weak var trayView: UIView!
    var image: UIImage!
    
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUpOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    var tappedImageCenterX: CGFloat!
    let tap = UITapGestureRecognizer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageScrollVIew.delegate = self
        
        tappedImageCenterX = view.center.x
        lightBoxImageView.center.x = tappedImageCenterX
        
        
        
        imageScrollVIew.contentSize = CGSize(width: 375, height: 800)
        imageScrollVIew.frame.size = CGSize(width: 375, height: 667)
        lightBoxImageView.image = image
        
        trayUpOffset = 150
        trayDown = trayView.center
        trayUp = CGPoint(x: trayView.center.x ,y: trayView.center.y - trayUpOffset)
        
        self.imageScrollVIew.minimumZoomScale = 1
        self.imageScrollVIew.maximumZoomScale = 4
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapDIsmissLightBox(_ sender: UITapGestureRecognizer) {
        if  tap.numberOfTapsRequired == 1 {
            dismiss(animated: true, completion: nil)

        }

        
        
    }
    
    

    func imageViewForTapped() -> UIImageView {
        return   transitionToImageView

    }
    
    @IBAction func tapLightBoxPhoto(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func panTray(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            trayOriginalCenter = trayView.center
            
            
            
        } else if sender.state == .changed {
            print(location)
            if location.y < 350 {
                trayView.center = CGPoint(x: trayOriginalCenter.x, y: 667 + (translation.y / 10))
            } else {
                trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            }
            
            
        } else if sender.state == .ended {
            
            let velocity = sender.velocity(in: view)
            
            if velocity.y > -100 {
                UIView.animate(withDuration: 0.7, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
                    
                    self.trayView.center = self.trayDown
                    self.descrBoxArrow.transform = self.descrBoxArrow.transform.rotated(by:CGFloat(-180 * M_PI / 180))
                    
                }) { (Bool) in
                    
                }
                
                
            } else if velocity.y < 100 {
                UIView.animate(withDuration: 0.7, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
                    
                    self.trayView.center = self.trayUp
                    self.descrBoxArrow.transform = self.descrBoxArrow.transform.rotated(by:CGFloat(180 * M_PI / 180))
                    
                    
                }) { (Bool) in
                    
                }
                
            }
            
        }
        
    }

    
    @IBAction func didTapArrow(_ sender: Any) {
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        
        if imageScrollVIew.contentOffset.y > 0 &&  imageScrollVIew.contentOffset.y < 100 {
            let alphaLightBox = convertValue(inputValue: imageScrollVIew.contentOffset.y, r1Min: 0, r1Max: 100, r2Min: 1, r2Max: 0.3)
            
            lightBoxBG.alpha = alphaLightBox
            
            let alphaButtons = convertValue(inputValue: imageScrollVIew.contentOffset.y, r1Min: 0, r1Max: 100, r2Min: 1, r2Max: 0)
            self.trayView.alpha = alphaButtons
            self.dismissButton.alpha = alphaButtons
            
        } else if imageScrollVIew.contentOffset.y > -100 &&  imageScrollVIew.contentOffset.y < 0 {
            let alphaLightBox = convertValue(inputValue: imageScrollVIew.contentOffset.y, r1Min: 0, r1Max: -100, r2Min: 1, r2Max: 0.3)
            lightBoxBG.alpha = alphaLightBox
            
            let alphaButtons = convertValue(inputValue: imageScrollVIew.contentOffset.y, r1Min: 0, r1Max: -100, r2Min: 1, r2Max: 0)
            
            
            self.trayView.alpha = alphaButtons
            self.dismissButton.alpha = alphaButtons
        }

    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        lightBoxImageView.center.x = tappedImageCenterX

        if imageScrollVIew.contentOffset.y < -120 {
            print("dismiss on scroll")
            lightBoxBG.isHidden = true
            dismissButton.isHidden = true
            trayView.isHidden = true
            UIView.animate(withDuration: 0.4, animations: {
                
                self.dismiss(animated: true, completion: nil)
                
            })
            
        } else if imageScrollVIew.contentOffset.y > 120 {
            print("dismiss on scroll")
            lightBoxBG.isHidden = true
            trayView.isHidden = true
            dismissButton.isHidden = true
            UIView.animate(withDuration: 0.4, animations: {
                
                self.dismiss(animated: true, completion: nil)
                
            })
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return lightBoxImageView
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        imageScrollVIew.isScrollEnabled = false
        
        lightBoxBG.isHidden = false
        lightBoxBG.alpha = 1
        
        dismissButton.isHidden = true
        trayView.isHidden = true
        moreBUtton.isHidden = true
        

        
        print("zoom began")
        
    }
    
    
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("zoom ended")
        lightBoxBG.alpha = 1
        
        
        
        if imageScrollVIew.zoomScale < 1.5 {
            print("zoomScale down")
            
            self.imageScrollVIew.frame = CGRect(x: 0, y: 52, width: 375, height: 562)
            self.imageScrollVIew.frame = CGRect(x: 0, y: 0, width: 375, height: 562)
            
            dismissButton.isHidden = false
            trayView.isHidden = false
            moreBUtton.isHidden = false
           
            
        }else if imageScrollVIew.zoomScale > 1.5 {

            print("zoomScale up")
            dismissButton.isHidden = true
            trayView.isHidden = true
            moreBUtton.isHidden = true

            imageScrollVIew.isScrollEnabled = true
        
            
            imageScrollVIew.contentSize.applying(CGAffineTransform.init(scaleX: 2, y: 2))
            imageScrollVIew.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            
        }
        
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("is zooming")
        
        imageScrollVIew.contentSize.applying(CGAffineTransform.init(scaleX: 2, y: 2))
        lightBoxBG.alpha = 1
        UIView.animate(withDuration: 0.4, animations: {
            
            self.imageScrollVIew.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            
        })
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
