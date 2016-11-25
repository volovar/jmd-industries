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
    
    var projectExpandedViewOriginalY: CGFloat!
    

    @IBOutlet weak var plusButtonBGColor: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.textColor = UIColor.white
        subtitleLabel.textColor = UIColor.white
        
        
       projectExpandedViewOriginalY =  projectExpandedView.center.y

        self.projectExpandedView.frame.origin.y = self.projectExpandedViewOriginalY

    }
    
    @IBAction func didPressBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func didPressPlusButton(_ sender: Any) {
        
        
        UIView.animate(withDuration: 0.2, delay: 1.4, options: [], animations:{
            
        }){ (Bool) in
            UIView.animate(withDuration: 0.5, delay: 0.1, options: [], animations:{
                
                self.projectExpandedView.center.y = self.projectExpandedViewOriginalY + 200
                
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: [], animations:{
            
        })
        { (Bool) in
            UIView.animate(withDuration: 0.5, delay: 0.1, options: [], animations:{
                
                
                
            })
        }

        
        
        
        
        
    }
}
