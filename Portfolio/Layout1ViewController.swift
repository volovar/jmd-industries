//
//  git branch
//  Iceberg
//
//  Created by Michael Volovar on 11/22/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit
import AFNetworking

class Layout1ViewController: UIViewController {
    
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Text
    
    @IBOutlet weak var projectDescription: UITextView!
    @IBOutlet weak var researchText: UITextView!
    @IBOutlet weak var theProblemText: UITextView!
    @IBOutlet weak var theSolutionText: UITextView!
    @IBOutlet weak var resultsText: UITextView!
    
    var bodyTextStyle: NSMutableParagraphStyle!
    var bodyTextAttributes: [String : Any]!
    
    
    // Colors
    
    let lightGrey = UIColor(red:180/255.0, green:180/255.0, blue:180/255.0, alpha: 1.0)
    let midGrey = UIColor(red:90/255.0, green:90/255.0, blue:120/255.0, alpha: 1.0)
    let darkGrey = UIColor(red:50/255.0, green:50/255.0, blue:50/255.0, alpha: 1.0)
    
    
    //    let imageOneURL = URL(string: "https://s0.wp.com/wp-content/themes/vip/fb-liveblog/images/landing-page/background-main.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 375, height: 3600)
        
        // Global body text
        
        bodyTextStyle = NSMutableParagraphStyle()
        bodyTextStyle.lineSpacing = 1.5
        bodyTextAttributes = [NSParagraphStyleAttributeName: bodyTextStyle]
        
        // Intro section
        
        imageOne.image = #imageLiteral(resourceName: "facebook_live")
        
        projectDescription.text = "Facebook Live makes it easy to share the moment with people you care about. Even if you can't all be in the same place, you can still connect through Live video."

        styleBodyParagraphs(referenceTextView: projectDescription, bodyText: projectDescription.text)
        
        theProblemText.text = "With the popularity of apps like Meerkat and Periscope, we noticed that people wanted to share events in real-time, but 'social network fatigue' would set in when they opened multiple apps to share their experiences. It made sense for the world's largest social network to be a reliable hub for real-time communication."
        
        styleBodyParagraphs(referenceTextView: theProblemText, bodyText: theProblemText.text)
        
        researchText.text = "Our team used two primary research methods to understand the user's needs. Our primary method was field observation. We recorded user behaviors at the moment when they utilized curent market offerings. We confirmed our hypothesis that users are drawn to live sharing apps primarily due to the immediate feedback they receive. A notable drawback in the current market offering was what we termed 'social network fatigue,' caused by switching between different sharing apps. Over 80% of target users shared live once, while only 37% shared live twice, opting instead to record experiences in less ephemeral ways. Our second method involved interviews with the target user base. We obtained valuable insight into use-cases we had previously not considered, such as sharing live as a means of direct communication."
        
        styleBodyParagraphs(referenceTextView: researchText, bodyText: researchText.text)
        
        theSolutionText.text = "Our solution at Facebook was to give users the ability to share in real-time, using a top-level affordance in their mobile app. Users would be able share traditional photos and text, while sharing live, through one seamless experience."
        
        styleBodyParagraphs(referenceTextView: theSolutionText, bodyText: theSolutionText.text)
        
        resultsText.text = "Early adoption was strong, with 3% of users exploring the feature within the first week of launch. At the close of the first month, nearly 47% of users globally were sharing live on a regular basis."
        
        styleBodyParagraphs(referenceTextView: resultsText, bodyText: resultsText.text)
        
    } // end viewDidLoad
    
    
    // Style text in the company descriptions
    func styleBodyParagraphs (referenceTextView: UITextView!, bodyText: String!) {
        
        referenceTextView.attributedText = NSAttributedString(string: bodyText, attributes: bodyTextAttributes)
        referenceTextView.font = referenceTextView.font?.withSize(16)
        referenceTextView.textColor = darkGrey
        
    } // end styleCompanyDescriptionText
    
    func styleTitles () {
        
    }
    
}

