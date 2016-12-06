//
// ProjectsDataCell.swift
//  Iceberg
//
//  Created by user on 11/26/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class ProjectsDataCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
//        Changing color and making button a circle
        
        plusButtonBGColor.layer.cornerRadius = 0.5 * plusButtonBGColor.bounds.size.width
        plusButtonExpanded.layer.cornerRadius = 0.5 * plusButtonExpanded.bounds.size.width
        plusButtonExpanded.clipsToBounds = true
        plusButtonBGColor.alpha = 0.6
        plusButtonExpanded.alpha = 0.6
        plusButtonBGColor.clipsToBounds = true
        self.plusButtonExpanded.alpha = 0
        
//        setting up original position for Expanded View
        
            projectExpandedViewOriginalY =  projectExpandedView.frame.origin.y
        backgroundViewProjectOriginalY = backgroundViewProject.frame.origin.y
        
        

    }
    
    @IBOutlet weak var titleSectionBackground: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var projectExpandedView: UIView!
    @IBOutlet weak var plusButtonBGColor: UIButton!
    @IBOutlet weak var photoDarkMask: UIView!
    
    @IBOutlet weak var backgroundViewProject: UIView!
    @IBOutlet weak var plusButtonExpanded: UIButton!
    var projectExpandedViewOriginalY: CGFloat!
    var backgroundViewProjectOriginalY: CGFloat!

    
    @IBOutlet weak var projectImageView: UIImageView!
    
    @IBOutlet weak var projecTitle: UILabel!
    @IBOutlet weak var projectTags: UILabel!
    
    @IBOutlet weak var projectDescription: UITextView!
    
    var project: SingleProject! {
        didSet {
            self.updateUI()
        }
        
    }
    func updateUI() {
        projectImageView.image = UIImage(named: project.projectImage)
        projecTitle.text = project.projectTitle
        projectTags.text = project.projectTags
        projectDescription.text = project.projectDescription

        
    }

    
    @IBAction func didPressExpand(_ sender: Any) {
        print("plusButton pressed")
                self.plusButtonBGColor.alpha = 0.6
        
        
        
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{
                    self.plusButtonBGColor.alpha = 0
                    self.plusButtonExpanded.alpha = 0.6
        
                    self.projectExpandedView.frame.origin.y = self.projectExpandedViewOriginalY + 260
        
                    UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{
        
                        self.backgroundViewProject.frame.origin.y =  self.backgroundViewProjectOriginalY - self.projectExpandedViewOriginalY + 65
                        self.photoDarkMask.alpha = 0.7
        
        
                    })
        
        
        
        
        
        
        
                })
                { (Bool) in
                    UIView.animate(withDuration: 0, delay: 0.05, options: [], animations:{
                        
                        self.plusButtonBGColor.isEnabled = false
                        
                        
                    })
                }

        
    }
    
    @IBAction func didPressCollapse(_ sender: Any) {
        
        print("collapseButton pressed")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{
            self.plusButtonExpanded.alpha = 0
            self.plusButtonBGColor.alpha = 0.6
            
            UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:{
                
                self.projectExpandedView.frame.origin.y = self.projectExpandedViewOriginalY
                
                self.photoDarkMask.alpha = 0.4
                
            })
            self.backgroundViewProject.frame.origin.y =  self.backgroundViewProjectOriginalY - 48 - self.projectExpandedViewOriginalY
            
            
            
        })
        { (Bool) in
            UIView.animate(withDuration: 0, delay: 0.05, options: [], animations:{
                
                self.plusButtonBGColor.isEnabled = true
                
                
            })
        }
        

    }
   
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }

}
