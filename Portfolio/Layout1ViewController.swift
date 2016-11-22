//
//  Layout1ViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/22/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit
import AFNetworking

class Layout1ViewController: UIViewController {
    @IBOutlet weak var bodyText: UITextView!
    @IBOutlet weak var imageOne: UIImageView!
    
    let imageOneURL = URL(string: "https://s0.wp.com/wp-content/themes/vip/fb-liveblog/images/landing-page/background-main.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyText.text = "Facebook Live makes it easy to share the moment with people you care about. Even if you can't all be in the same place, you can still connect through Live video."
        imageOne.setImageWith(imageOneURL!)
    }
}
