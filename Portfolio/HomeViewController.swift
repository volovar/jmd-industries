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
    
    // Actual app items

    // Top: author section
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var authorProfileImageView: UIImageView!
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorTitle: UILabel!
    
    @IBOutlet weak var authorDescription: UITextView!
    
    // Colors
    
    let lightGrey = UIColor(red:180/255.0, green:180/255.0, blue:180/255.0, alpha: 1.0)
    let midGrey = UIColor(red:90/255.0, green:90/255.0, blue:120/255.0, alpha: 1.0)
    let darkGrey = UIColor(red:50/255.0, green:50/255.0, blue:50/255.0, alpha: 1.0)
    
    // Generic text styling items
    
    var authorDescriptionAttributes: [String : Any]!
    
    var companyDescriptionStyle: NSMutableParagraphStyle!
    var companyDescriptionAttributes: [String : Any]!
    
    
    // Author work history
    
    // Facebook
    @IBOutlet weak var facebookTitle: UILabel!
    @IBOutlet weak var facebookDescription: UITextView!
    
    @IBOutlet weak var facebookLiveSuperView: UIView!
    @IBOutlet weak var facebookLive: UIImageView!
    @IBOutlet weak var facebookLiveLabel: UILabel!
    
    @IBOutlet weak var educationSeriesSuperView: UIView!
    @IBOutlet weak var educationSeries: UIImageView!
    @IBOutlet weak var facebookEducationSeries: UILabel!
    
    // Yahoo!
    @IBOutlet weak var yahooTitle: UILabel!
    @IBOutlet weak var yahooDescription: UITextView!
    
    
    @IBOutlet weak var yahooProjectSuperView: UIView!
    @IBOutlet weak var yahooProject: UIImageView!
    @IBOutlet weak var yahooProjectTitle: UILabel!
    
    // Moovly
    @IBOutlet weak var moovlyTitle: UILabel!
    @IBOutlet weak var moovlyDescription: UITextView!
    
    
    @IBOutlet weak var moovlySuperView: UIView!
    @IBOutlet weak var moovlyProject: UIImageView!
    @IBOutlet weak var moovlyProjectLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("viewDidLoad has executed")
        
        /////////////////////////////////
        ///// Author Images Section /////
        /////////////////////////////////
        
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
        
        
        ///////////////////////////////
        ///// Author Info Section /////
        ///////////////////////////////
        
        // Author name styling
        
        let authorNameAttributedString = NSMutableAttributedString(string: authorNameLabel.text!)
        
        // Adjust name kerning
        authorNameAttributedString.addAttribute(NSKernAttributeName, value: CGFloat(1.7), range: NSRange(location: 0, length: authorNameAttributedString.length))
        
        authorNameLabel.attributedText = authorNameAttributedString
        authorNameLabel.textColor = darkGrey
        authorNameLabel.font = authorNameLabel.font?.withSize(29)
        
        // Author title/description styling
        
        // Multi-use styling
        let authorDescriptionParagraphStyle = NSMutableParagraphStyle()
        authorDescriptionParagraphStyle.lineSpacing = 1.2
        authorDescriptionParagraphStyle.alignment = NSTextAlignment.center
        
        authorDescriptionAttributes = [NSParagraphStyleAttributeName: authorDescriptionParagraphStyle]
    
        let authorTitleText = "Product Designer"
        
        authorTitle.attributedText = NSAttributedString(string: authorTitleText, attributes: authorDescriptionAttributes)
        authorTitle.font = authorTitle.font?.withSize(18)
        authorTitle.textColor = midGrey
        
        let authorDescriptionText = "Senior mobile designer, specializing in new feature development. Research, prototype, learn, build. Formerly at Facebook, Yahoo!, and Moovly."
        
        authorDescription.attributedText = NSAttributedString(string: authorDescriptionText, attributes: authorDescriptionAttributes)
        authorDescription.font = authorDescription.font?.withSize(18)
        authorDescription.textColor = midGrey
        
        
        ///////////////////////////////
        ///// Work history section/////
        ///////////////////////////////
        
        // Global line spacing for company desriptions
        
        companyDescriptionStyle = NSMutableParagraphStyle()
        companyDescriptionStyle.lineSpacing = 1.5
        companyDescriptionAttributes = [NSParagraphStyleAttributeName: companyDescriptionStyle]
        
        
        // Facebook
        
        let facebookDescriptionText = "Helped design Facebook Live. Led a team of 3 designers on a 3-month expedition to research global usage of the Like button. Worked with top-level executives to create an in-house design educational series."
        
        styleCompanyParagraphs(companyDescription: facebookDescription, companyDescriptionText: facebookDescriptionText)
        
        setImage(imageView: facebookLive, image: #imageLiteral(resourceName: "facebook_live"))
        addImageShadow(imageSuperView: facebookLiveSuperView)
        
        setImage(imageView: educationSeries, image: #imageLiteral(resourceName: "education_series"))
        addImageShadow(imageSuperView: educationSeriesSuperView)
        
        // Yahoo
        
        let yahooDescriptionText = "Worked with VP of Product to design a new sleep tracker feature. Updated large portions of Yahoo! Answers to conform with modern design principles. Increased overall engagement by 6% through implementing cutting-edge information architecture techniques."
        
        styleCompanyParagraphs(companyDescription: yahooDescription, companyDescriptionText: yahooDescriptionText)
        
        setImage(imageView: yahooProject, image: #imageLiteral(resourceName: "sleep_tracker"))
        addImageShadow(imageSuperView: yahooProjectSuperView)
        
        
        // Moovly
        
        let moovlyDescriptionText = "Built an app for bovine relocation services. App summons relocator trucks to any spot in the world, inlcuding Antarctica. Adoption was nearly 100% in Central California. Incporporated tag-tracking and hoof-print ID to ensure cows were never lost."
        
        styleCompanyParagraphs(companyDescription: moovlyDescription, companyDescriptionText: moovlyDescriptionText)
        
        setImage(imageView: moovlyProject, image: #imageLiteral(resourceName: "moovly"))
        addImageShadow(imageSuperView: moovlySuperView)
        
        
        // Scroll view
        
        scrollView.contentSize = CGSize(width: 375, height: 3600)
        
        
    } // end viewDidLoad
    
    
    
    // Set navigation bar to hidden or visible on appear / disappear
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    
    // Style text in the company descriptions
    func styleCompanyParagraphs (companyDescription: UITextView!, companyDescriptionText: String!) {
            
            companyDescription.attributedText = NSAttributedString(string: companyDescriptionText, attributes: companyDescriptionAttributes)
            companyDescription.font = companyDescription.font?.withSize(16)
            companyDescription.textColor = darkGrey
        
    } // end styleCompanyDescriptionText
    
    
    
    func setImage (imageView: UIImageView, image: UIImage) {
        
        imageView.image = image
        
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.layer.cornerRadius = 8
        
    } // end setImage
    
    

    func addImageShadow (imageSuperView: UIView!) {
        
        imageSuperView.layer.shadowColor = UIColor.black.cgColor
        imageSuperView.layer.shadowOpacity = 0.4
        imageSuperView.layer.shadowOffset = CGSize(width: 0, height: 12)
        imageSuperView.layer.shadowRadius = 12
        
    } // end addImageShadow
    
    
    
    
    
} // end class
