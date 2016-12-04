//
//  OnBoardingViewController.swift
//  Iceberg
//
//  Created by user on 12/2/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var typeView: UIView!
    
    @IBOutlet weak var logoBase4: UIImageView!
    
    @IBOutlet weak var logoBase3: UIImageView!
    
    @IBOutlet weak var logoBase2: UIImageView!
    
    @IBOutlet weak var logoBase1: UIImageView!
    
    @IBOutlet weak var loginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.frame.size = view.frame.size
        scrollView.contentSize.height = 1334
        

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        let offSet = Float(scrollView.contentOffset.y)
        
        // type fade out
        
        let typeOpacity = convertValue(inputValue: CGFloat(offSet), r1Min: 0, r1Max: 110, r2Min: 1, r2Max: 0)
        typeView.alpha = typeOpacity
        
        // base of logo 4
        let tyLogo4 = convertValue(inputValue: CGFloat(offSet), r1Min: 0, r1Max: 667, r2Min: -1150, r2Max: 0)
        logoBase4.transform = CGAffineTransform(translationX: 0, y: tyLogo4)
        
        
        // base of logo 3
        let tyLogo3 = convertValue(inputValue: CGFloat(offSet), r1Min: 0, r1Max: 667, r2Min: -1400, r2Max: 0)
        logoBase3.transform = CGAffineTransform(translationX: 0, y: tyLogo3)
      
        // base of logo 2
        let tyLogo2 = convertValue(inputValue: CGFloat(offSet), r1Min: 0, r1Max: 667, r2Min: -1650, r2Max: 0)
        logoBase2.transform = CGAffineTransform(translationX: 0, y: tyLogo2)
        
        // base of logo 1
        let tyLogo1 = convertValue(inputValue: CGFloat(offSet), r1Min: 0, r1Max: 667, r2Min: -1900, r2Max: 0)
        logoBase1.transform = CGAffineTransform(translationX: 0, y: tyLogo1)
        
        if scrollView.contentOffset.y > 690 {
            
            scrollView.contentOffset.y = 690
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
