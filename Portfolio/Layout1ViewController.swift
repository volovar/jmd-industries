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
    
    @IBOutlet weak var projectDescription: UITextView!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Text
    
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

