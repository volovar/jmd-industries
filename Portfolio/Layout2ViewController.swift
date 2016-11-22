//
//  Layout2ViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/22/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit
import AFNetworking

class Layout2ViewController: UIViewController {
    @IBOutlet weak var bodyText: UITextView!
    @IBOutlet weak var imageOne: UIImageView!

    let imageOneURL = URL(string: "https://s0.wp.com/wp-content/themes/vip/fb-liveblog/images/landing-page/background-main-2.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyText.text = "Want to show friends what you're up to? Have something on your mind that you want to share? Just look for (video icon) and then tap"
        imageOne.setImageWith(imageOneURL!)
    }

}
