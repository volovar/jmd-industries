//
//  OnBoardingStepsViewController.swift
//  Iceberg
//
//  Created by user on 12/3/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class OnBoardingStepsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var onBoardingMask: UIImageView!
    @IBOutlet weak var onBoardingPageControl: UIPageControl!
    @IBOutlet weak var scrollVIew: UIScrollView!
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var sassFinal: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollVIew.delegate = self
        
        scrollVIew.contentSize = CGSize(width: 1875, height: 667)
        scrollVIew.frame.size = CGSize(width: 375, height: 667)


        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page: Int = Int(round(scrollView.contentOffset.x / 375))
        onBoardingPageControl.currentPage = page

        
        if page == 3 {
            
            self.getStartedButton.transform = CGAffineTransform.identity
            self.sassFinal.transform = CGAffineTransform.identity
            self.getStartedButton.alpha = 0
            onBoardingMask.alpha = 1
            
            
        }
        if page == 4 {
//             self.sassFinal.transform = self.sassFinal.transform.translatedBy(x: 0, y: 380)
            
            self.getStartedButton.alpha = 0
            UIView.animate(withDuration: 1.75, animations: {
                self.onBoardingMask.alpha = 0.2
                
            })  { (Bool) in
                UIView.animate(withDuration: 0.5, delay: 0.3, animations: {
//                    self.getStartedButton.transform = self.getStartedButton.transform.scaledBy(x: 1.2, y: 1.2)
                    self.getStartedButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.getStartedButton.alpha = 1
                })
            }
            
            UIView.animate(withDuration: 1.75, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0.7, options: [], animations:{
                self.sassFinal.transform = CGAffineTransform(translationX: 0, y: -380)
                
            })
            { (Bool) in
                UIView.animate(withDuration: 0.4, delay: 0, options: [.repeat, .autoreverse], animations:{
                    self.sassFinal.transform = CGAffineTransform(translationX: 0, y: -375)

                    
                })
   
            }
  
        }
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
