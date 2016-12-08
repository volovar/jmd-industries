//
//  ProjectStepsViewController.swift
//  Iceberg
//
//  Created by user on 12/5/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class ProjectStepsViewController: UIViewController, UIScrollViewDelegate{
    
    
    @IBOutlet weak var dismissFromRed: UIButton!
    
    @IBOutlet weak var dismissFromYellow: UIButton!
        @IBOutlet weak var dismissFromGreen: UIButton!
        @IBOutlet weak var dismissFromBlue: UIButton!
        @IBOutlet weak var dismissFromPurple: UIButton!
    

    
    @IBOutlet weak var problemIcon: UIButton!
    @IBOutlet weak var researchIcon: UIButton!
    @IBOutlet weak var developIcon: UIButton!
    @IBOutlet weak var resultIcon: UIButton!
    @IBOutlet weak var solutionIcon: UIButton!
    
    let myRed = UIColor(red:191/255.0, green:84/255.0, blue:78/255.0, alpha: 1.0)
    let myYellow = UIColor(red:40/255.0, green:200/255.0, blue:50/255.0, alpha: 1.0)
    let myGreen = UIColor(red:140/255.0, green:200/255.0, blue:50/255.0, alpha: 1.0)
    let myBlue = UIColor(red:40/255.0, green:20/255.0, blue:50/255.0, alpha: 1.0)
    let myPurple = UIColor(red:40/255.0, green:200/255.0, blue:200/255.0, alpha: 1.0)
    
    




    
  
    @IBOutlet weak var viewTransitionRed: UIView!
    
    @IBOutlet weak var viewTransition: UIView!
    @IBOutlet weak var projectStepsScrollView: UIScrollView!
    
    @IBOutlet weak var transitionGreenYellowBack: UIView!
    @IBOutlet weak var viewTransittionYellow: UIView!
    
    @IBOutlet weak var viewTransitionGreen: UIView!
    
    @IBOutlet weak var transitionBlueGreenBack: UIView!
    
    @IBOutlet weak var viewTransitionPurple: UIView!
    @IBOutlet weak var transtionBluePurpleBack: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
    projectStepsScrollView.setContentOffset(CGPoint(x: contentOffset, y: 0), animated: false)
    }
    
    var contentOffset: CGFloat = 0
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissFromYellow.isHidden = true
        dismissFromRed.isHidden = true
        dismissFromGreen.isHidden = true
        dismissFromBlue.isHidden = true
        dismissFromPurple.isHidden = true

        
        
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
        
        // circular animation
        
        dismissFromRed.layer.cornerRadius = 0.5 * dismissFromRed.bounds.size.width
        dismissFromRed.layer.borderWidth = 3
        dismissFromRed.layer.borderColor = myRed.cgColor
        
        dismissFromYellow.layer.cornerRadius = 0.5 * dismissFromYellow.bounds.size.width
        dismissFromYellow.layer.borderWidth = 3
        dismissFromYellow.layer.borderColor = myYellow.cgColor
        
        dismissFromGreen.layer.cornerRadius = 0.5 * dismissFromGreen.bounds.size.width
        dismissFromGreen.layer.borderWidth = 3
        dismissFromGreen.layer.borderColor = myGreen.cgColor
        
        dismissFromBlue.layer.cornerRadius = 0.5 * dismissFromBlue.bounds.size.width
        dismissFromBlue.layer.borderWidth = 3
        dismissFromBlue.layer.borderColor = myBlue.cgColor
        
        dismissFromPurple.layer.cornerRadius = 0.5 * dismissFromPurple.bounds.size.width
        dismissFromPurple.layer.borderWidth = 3
        dismissFromPurple.layer.borderColor = myPurple.cgColor
        
        
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        projectStepsScrollView.setContentOffset(CGPoint(x: contentOffset, y: 0), animated: false)
//    }
    
  
    
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
    
    @IBAction func tappedDIsmiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showDismissFromRed(_ sender: Any) {
        dismissFromRed.isHidden = false
    }
    
 
    
    @IBAction func tapDismissFromRed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        dismissFromRed.isHidden = true
    }
    
    
    @IBAction func showDismissFromYellow(_ sender: Any) {
        dismissFromYellow.isHidden = false
    }
    @IBAction func tapDismissFromYellow(_ sender: Any) {
        dismiss(animated: true, completion: nil)

                dismissFromYellow.isHidden = true
        
    }

    
    @IBAction func showDismissFromGreen(_ sender: Any) {
        
        dismissFromGreen.isHidden = false

        
    }
    
    @IBAction func tapDismissFromGreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        dismissFromGreen.isHidden = true
    }
    
    @IBAction func showDismissFromBlue(_ sender: Any) {
        
        dismissFromBlue.isHidden = false
    }
    
    @IBAction func tapDismissFromBlue(_ sender: Any) {
        dismissFromPurple.isHidden = true

        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func showDismissFromPurple(_ sender: Any) {
        dismissFromPurple.isHidden = false

  
    }
    
    @IBAction func tapDismissFromPurple(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        dismissFromPurple.isHidden = true
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
