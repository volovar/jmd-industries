//
//  ProjectStepsViewController.swift
//  Iceberg
//
//  Created by user on 12/5/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class ProjectStepsViewController: UIViewController, UIScrollViewDelegate{
    
    
    
    @IBOutlet weak var resultIcon: UIImageView!
    @IBOutlet weak var solutionIcon: UIImageView!
    @IBOutlet weak var developIcon: UIImageView!
    @IBOutlet weak var researchIcon: UIImageView!
    @IBOutlet weak var problemIcon: UIImageView!
    @IBOutlet weak var viewTransitionRed: UIView!
    
    @IBOutlet weak var viewTransition: UIView!
    @IBOutlet weak var projectStepsScrollView: UIScrollView!
    
    @IBOutlet weak var transitionGreenYellowBack: UIView!
    @IBOutlet weak var viewTransittionYellow: UIView!
    
    @IBOutlet weak var viewTransitionGreen: UIView!
    
    @IBOutlet weak var transitionBlueGreenBack: UIView!
    
    @IBOutlet weak var viewTransitionPurple: UIView!
    
    @IBOutlet weak var transtionBluePurpleBack: UIView!
    
    
    var contentOffset: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectStepsScrollView.delegate = self
        
        projectStepsScrollView.contentSize = CGSize(width: 1875, height: 1000)
        projectStepsScrollView.frame.size = CGSize(width: 375, height: 667)
        
        viewTransition.layer.cornerRadius = 0.5 * viewTransition.bounds.size.width
        viewTransitionRed.layer.cornerRadius = 0.5 * viewTransitionRed.bounds.size.width
        viewTransittionYellow.layer.cornerRadius = 0.5 * viewTransittionYellow.bounds.size.width
        viewTransitionGreen.layer.cornerRadius = 0.5 * viewTransitionGreen.bounds.size.width
        transitionGreenYellowBack.layer.cornerRadius = 0.5 * viewTransitionGreen.bounds.size.width
        
        transitionBlueGreenBack.layer.cornerRadius = 0.5 * transitionBlueGreenBack.bounds.size.width
        viewTransitionPurple.layer.cornerRadius = 0.5 * viewTransitionPurple.bounds.size.width
        transtionBluePurpleBack.layer.cornerRadius = 0.5 * transtionBluePurpleBack.bounds.size.width
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        projectStepsScrollView.setContentOffset(CGPoint(x: contentOffset, y: 0), animated: true)
    }
    
  
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(projectStepsScrollView.contentOffset.x)
        let page: Int = Int(round(scrollView.contentOffset.x / 375))

        if page == 0 {
            projectStepsScrollView.contentSize = CGSize(width: 1875, height: 1500)
            projectStepsScrollView.frame.size = CGSize(width: 375, height: 667)
            
        }
        if page == 1 {
            projectStepsScrollView.contentSize = CGSize(width: 1875, height: 900)
            projectStepsScrollView.frame.size = CGSize(width: 375, height: 667)

        }
        if page == 2 {
            projectStepsScrollView.contentSize = CGSize(width: 1875, height: 2000)
            projectStepsScrollView.frame.size = CGSize(width: 375, height: 667)
            
        }
        if page == 3 {
            projectStepsScrollView.contentSize = CGSize(width: 1875, height: 4000)
            projectStepsScrollView.frame.size = CGSize(width: 375, height: 667)
            
        }
        if page == 4 {
            projectStepsScrollView.contentSize = CGSize(width: 1875, height: 5000)
            projectStepsScrollView.frame.size = CGSize(width: 375, height: 667)
            
        }
        
        let transitionAlphaRed = convertValue(inputValue: CGFloat(projectStepsScrollView.contentOffset.x), r1Min: 100, r1Max: 375, r2Min: 1, r2Max: 0)
        viewTransitionRed.alpha = transitionAlphaRed
        
        let transitionAlphaYellow = convertValue(inputValue: CGFloat(projectStepsScrollView.contentOffset.x), r1Min: 475, r1Max: 750, r2Min: 1, r2Max: 0)
        
        viewTransittionYellow.alpha = transitionAlphaYellow
        
        let transitionAlphaGreen = convertValue(inputValue: CGFloat(projectStepsScrollView.contentOffset.x), r1Min: 850, r1Max: 1125, r2Min: 1, r2Max: 0)
        
        viewTransitionGreen.alpha = transitionAlphaGreen
        
        let transitionAlphaBlue = convertValue(inputValue: CGFloat(projectStepsScrollView.contentOffset.x), r1Min: 1225, r1Max: 1500, r2Min: 1, r2Max: 0)
        
        viewTransitionPurple.alpha = transitionAlphaBlue
        
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page: Int = Int(round(scrollView.contentOffset.x / 375))
//        onBoardingPageControl.currentPage = page

        self.problemIcon.transform = CGAffineTransform.identity
        self.researchIcon.transform = CGAffineTransform.identity
        self.developIcon.transform = CGAffineTransform.identity
        self.solutionIcon.transform = CGAffineTransform.identity
        self.resultIcon.transform = CGAffineTransform.identity

        
        if page == 0 {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.5, options: [], animations:{
                
                self.problemIcon.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)

            })
            { (Bool) in
            
            }

        }
        if page == 1 {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.5, options: [], animations:{
                
                self.problemIcon.transform = CGAffineTransform.identity
                self.researchIcon.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            { (Bool) in}
            
        }
        if page == 2 {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.5, options: [], animations:{
                self.developIcon.transform = CGAffineTransform.identity
                self.researchIcon.transform = CGAffineTransform.identity
                self.developIcon.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            { (Bool) in}
            
        }
        if page == 3 {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.5, options: [], animations:{
                self.solutionIcon.transform = CGAffineTransform.identity

                self.developIcon.transform = CGAffineTransform.identity
                self.solutionIcon.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            { (Bool) in}
            
        }
        if page == 4 {
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.5, options: [], animations:{
                
                self.solutionIcon.transform = CGAffineTransform.identity
                self.resultIcon.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            { (Bool) in}
            
        }
        
    }
    


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
