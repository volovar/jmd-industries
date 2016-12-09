//
//  MyPorfolioViewController.swift
//  Iceberg
//
//  Created by user on 12/8/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class MyPorfolioViewController: UIViewController {
    var fadeTransition: FadeTransition!
    

    @IBOutlet weak var authorProfileImageView: UIImageView!
    //Wireframe items
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Actual app items
    
    // Top: author section
    @IBOutlet weak var heroImageView: UIImageView!
 
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
    
    // Yahoo!
    @IBOutlet weak var yahooTitle: UILabel!
    @IBOutlet weak var yahooDescription: UITextView!
    
    // Moovly
    @IBOutlet weak var moovlyTitle: UILabel!
    @IBOutlet weak var moovlyDescription: UITextView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
        /////////////////////////////////
        ///// Author Images Section /////
        /////////////////////////////////
        
        // Assign hero image

        
        // Author profile image styling
   
         authorProfileImageView.image = UIImage(named: "profilePic")
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
        

        
        // Adjust name kerning
    
        
     
        
        // Author title/description styling
        

        ///////////////////////////////
        ///// Work history section/////
        ///////////////////////////////
        
        // Global line spacing for company desriptions
        companyDescriptionStyle = NSMutableParagraphStyle()
        companyDescriptionStyle.lineSpacing = 1.5
        companyDescriptionAttributes = [NSParagraphStyleAttributeName: companyDescriptionStyle]
            // Yahoo
        
        // Scroll view
        scrollView.contentSize = CGSize(width: 375, height: 2060)
        
        
    } // end viewDidLoad
    
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
    
    
    /////////////////////
    //    transitions
    /////////////////////
    // replace with something nicer
    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // set up a fade transition
        let destination = segue.destination
        fadeTransition = FadeTransition()
        destination.modalPresentationStyle = .custom
        destination.transitioningDelegate = fadeTransition
        fadeTransition.duration = 0.35
        
        // for custom transitions
        if segue.identifier == "segueToDetailsView" {
            print("segue to details")
            
        } else if segue.identifier == "segueToInfoView" {
            print("segue to info")
        }
    }
    
    @IBAction func didTapInfo(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToInfoView", sender: nil)
    }
    
    @IBAction func didTapDetail(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToDetailsView", sender: nil)
    }
    
} // end class


