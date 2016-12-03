//
//  OnBoardingStepsViewController.swift
//  Iceberg
//
//  Created by user on 12/3/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class OnBoardingStepsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var onBoardingPageControl: UIPageControl!
    @IBOutlet weak var scrollVIew: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollVIew.delegate = self
        
        scrollVIew.contentSize = CGSize(width: 1500, height: 667)
        scrollVIew.frame.size = CGSize(width: 375, height: 667)

//        carousselButton.alpha = 0

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
          
            UIView.animate(withDuration: 0.7, animations: {
              
            })
            
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
