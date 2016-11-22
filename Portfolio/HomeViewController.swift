//
//  HomeViewController.swift
//  Portfolio
//
//  Created by Michael Volovar on 11/9/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //Wireframe items
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeImageView: UIImageView!
    
    // Actual app items

    // Top: author section
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var authorProfileImageView: UIImageView!
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorTitle: UILabel!
    
    @IBOutlet weak var authorDescriptionTextView: UITextView!
    
    // Colors
    
    let lightGrey = UIColor(red:180/255.0, green:180/255.0, blue:180/255.0, alpha: 1.0)
    let midGrey = UIColor(red:90/255.0, green:90/255.0, blue:120/255.0, alpha: 1.0)
    let darkGrey = UIColor(red:50/255.0, green:50/255.0, blue:50/255.0, alpha: 1.0)
    
    
    // Author work history
    
    @IBOutlet weak var facebookTitle: UILabel!
    @IBOutlet weak var facebookDescription: UITextView!
    
    // Work history images
    
    @IBOutlet weak var facebookLive: UIImageView!
    @IBOutlet weak var educationSeries: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign hero image
        
        heroImageView.image = #imageLiteral(resourceName: "sleep_tracker")
        heroImageView.contentMode = UIViewContentMode.scaleAspectFill
        heroImageView.clipsToBounds = true
        
        
        // Author profile image styling
        
        authorProfileImageView.image = #imageLiteral(resourceName: "author_photo")
        authorProfileImageView.frame.size = CGSize(width: 150, height: 150)
        
        // Create a circle by rounding the corners to half the imageView width
        authorProfileImageView.layer.cornerRadius = (authorProfileImageView.frame.width / 2)
        
        // Horizontally center the imageView by assigning the center.x to be half of the screen-width
        authorProfileImageView.center.x = (UIScreen.main.bounds.width / 2)
        authorProfileImageView.center.y = 195
        
        authorProfileImageView.clipsToBounds = true
        authorProfileImageView.layer.borderWidth = 3
        authorProfileImageView.layer.borderColor = lightGrey.cgColor
        
        
        // Author name styling
        
        let authorNameAttributedString = NSMutableAttributedString(string: authorNameLabel.text!)
        
        // Adjust name kerning
        authorNameAttributedString.addAttribute(NSKernAttributeName, value: CGFloat(1.7), range: NSRange(location: 0, length: authorNameAttributedString.length))
        
        authorNameLabel.attributedText = authorNameAttributedString
        authorNameLabel.textColor = darkGrey
        authorNameLabel.font = authorNameLabel.font?.withSize(29)
        
        // Author title/description styling
        
        let authorDescriptionParagraphStyle = NSMutableParagraphStyle()
        authorDescriptionParagraphStyle.lineSpacing = 1.2
        authorDescriptionParagraphStyle.alignment = NSTextAlignment.center
        
        let authorDescriptionAttributes = [NSParagraphStyleAttributeName: authorDescriptionParagraphStyle]
    
        let authorTitleText = "Product Designer"
        
        authorTitle.attributedText = NSAttributedString(string: authorTitleText, attributes: authorDescriptionAttributes)
        authorTitle.textColor = midGrey
        authorTitle.font = authorTitle.font?.withSize(18)

        
        // Author description stying
        
        let authorDescription = "Senior mobile designer, specializing in new feature development. Research, prototype, learn, build. Formerly at Facebook, Yahoo!, and Moovly."
        authorDescriptionTextView.attributedText = NSAttributedString(string: authorDescription, attributes: authorDescriptionAttributes)
        
        authorDescriptionTextView.font = authorDescriptionTextView.font?.withSize(18)
        authorDescriptionTextView.textColor = midGrey
        
        // Work history section
        
        let companyDescriptionStyle = NSMutableParagraphStyle()
        companyDescriptionStyle.lineSpacing = 1.5
        
        let companyDescriptionAttributes = [NSParagraphStyleAttributeName: companyDescriptionStyle]
        
        let facebookDescriptionText = "Helped design Facebook Live. Led a team of 3 designers on a 3-month expedition to research global usage of the Like button. Worked with top-level executives to create an in-house design educational series."
        
        facebookDescription.attributedText = NSAttributedString(string: facebookDescriptionText, attributes: companyDescriptionAttributes)
        
        facebookDescription.font = authorDescriptionTextView.font?.withSize(18)
        facebookDescription.textColor = darkGrey
        
        facebookLive.image = #imageLiteral(resourceName: "facebook_live")
        educationSeries.image = #imageLiteral(resourceName: "education_series")
        
        facebookLive.contentMode = UIViewContentMode.scaleAspectFill
        facebookLive.clipsToBounds = true
        
        educationSeries.contentMode = UIViewContentMode.scaleAspectFill
        educationSeries.clipsToBounds = true


        
        
        // Scroll view
        
        scrollView.contentSize = CGSize(width: 375, height: 2000)
        
        
    }
    
    // Devon's comment

}
