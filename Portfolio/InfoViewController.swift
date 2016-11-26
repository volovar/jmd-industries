//
//  InfoViewController.swift
//  Portfolio
//
//  Created by Michael Volovar on 11/9/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit
import AFNetworking

class InfoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var projectExpandedView: UIView!
    @IBOutlet weak var plusButtonBGColor: UIButton!
    @IBOutlet weak var photoDarkMask: UIView!
    
    @IBOutlet weak var backgroundViewProject: UIView!
    @IBOutlet weak var plusButtonExpanded: UIButton!
    var projectExpandedViewOriginalY: CGFloat!
    var backgroundViewProjectOriginalY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // changing mainProject Title Color
        titleLabel.textColor = UIColor.white
        subtitleLabel.textColor = UIColor.white
        
        
        // Changing color and making button a circle
        plusButtonBGColor.layer.cornerRadius = 0.5 * plusButtonBGColor.bounds.size.width
        plusButtonExpanded.layer.cornerRadius = 0.5 * plusButtonExpanded.bounds.size.width
        plusButtonExpanded.clipsToBounds = true
        plusButtonBGColor.alpha = 0.6
        plusButtonExpanded.alpha = 0.6
        plusButtonBGColor.clipsToBounds = true
        self.plusButtonExpanded.alpha = 0
        
        //setting up original position for Expanded View
        projectExpandedViewOriginalY =  projectExpandedView.frame.origin.y
        backgroundViewProjectOriginalY = backgroundViewProject.frame.origin.y
        
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func didPressPlusButton(_ sender: Any) {
        print("plusButton pressed")
        self.plusButtonBGColor.alpha = 0.6
        
        
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{
            self.plusButtonBGColor.alpha = 0
            self.plusButtonExpanded.alpha = 0.6
            
            self.projectExpandedView.frame.origin.y = self.projectExpandedViewOriginalY + 260
            
            UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{

                self.backgroundViewProject.frame.origin.y =  self.backgroundViewProjectOriginalY - self.projectExpandedViewOriginalY - 18
                self.photoDarkMask.alpha = 0.5

                
            })
            
            
            
            
            
            
            
        })
        { (Bool) in
            UIView.animate(withDuration: 0, delay: 0.05, options: [], animations:{
                
                self.plusButtonBGColor.isEnabled = false
                
                
            })
        }
        
    }
    
    
    @IBAction func didPressCollapseButton(_ sender: Any) {
        print("collapseButton pressed")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{
            self.plusButtonExpanded.alpha = 0
            self.plusButtonBGColor.alpha = 0.6
            
            UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{

                self.projectExpandedView.frame.origin.y = self.projectExpandedViewOriginalY

                self.photoDarkMask.alpha = 0.25

            })
            self.backgroundViewProject.frame.origin.y =  self.backgroundViewProjectOriginalY - 48 - self.projectExpandedViewOriginalY
            
            
            
        })
        { (Bool) in
            UIView.animate(withDuration: 0, delay: 0.05, options: [], animations:{
                
                self.plusButtonBGColor.isEnabled = true
                
                
                
                
                
            })
        }
        
    }
    
    
    
    
}
