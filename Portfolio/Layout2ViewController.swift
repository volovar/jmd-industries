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
    var lightBoxTransition: LightBoxTransition!

    

    let imageOneURL = URL(string: "https://s0.wp.com/wp-content/themes/vip/fb-liveblog/images/landing-page/background-main-2.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyText.text = "Want to show friends what you're up to? Have something on your mind that you want to share? Just look for (video icon) and then tap"
        imageOne.setImageWith(imageOneURL!)
    }
    
    @IBAction func tapLightBoxPhoto(_ sender: UITapGestureRecognizer) {
        print("didTapImageOne")
        imageOne = sender.view as! UIImageView
        imageOne.frame = sender.view!.frame
        performSegue(withIdentifier: "segueToLightBox", sender: nil)
        sender.numberOfTapsRequired = 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let lightBoxViewController = segue.destination as! LightBoxViewController
        
        lightBoxViewController.modalPresentationStyle = .custom
        
        lightBoxTransition = LightBoxTransition()
        
        lightBoxViewController.transitioningDelegate = lightBoxTransition
        
        lightBoxTransition.duration = 0.4
        lightBoxViewController.image = imageOne.image
        
        
    }

}
