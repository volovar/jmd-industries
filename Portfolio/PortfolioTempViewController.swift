//
//  PortfolioTempViewController.swift
//  Iceberg
//
//  Created by user on 11/30/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class PortfolioTempViewController: UIViewController, LightBoxTransitionPresentDelegate {

    @IBOutlet weak var transitionFromImageView: UIImageView!
    @IBOutlet weak var tempProjectDescription: UITextView!
    var image: UIImage!
    
    var lightBoxTransition: LightBoxTransition!
    
    let imageOneURL = URL(string: "https://s0.wp.com/wp-content/themes/vip/fb-liveblog/images/landing-page/background-main-2.jpg")

    override func viewDidLoad() {
        super.viewDidLoad()
        transitionFromImageView.image = image
        tempProjectDescription.text = "Want to show friends what you're up to? Have something on your mind that you want to share? Just look for (video icon) and then tap"
        

        transitionFromImageView.setImageWith(imageOneURL!)


        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLightBoxImage(_ sender: UITapGestureRecognizer) {
        print("didTapImageOne")
        transitionFromImageView = sender.view as! UIImageView
        transitionFromImageView.frame = sender.view!.frame
        performSegue(withIdentifier: "segueToLightBoxTemp", sender: nil)
        sender.numberOfTapsRequired = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageViewForTapped() -> UIImageView {
        return transitionFromImageView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let lightBoxViewController = segue.destination as! LightBoxViewController
        
        lightBoxViewController.modalPresentationStyle = .custom
        
        lightBoxTransition = LightBoxTransition()
        lightBoxTransition.presentDelegate = self
        lightBoxTransition.dismissDelegate = lightBoxViewController
        lightBoxViewController.transitioningDelegate = lightBoxTransition
        lightBoxTransition.duration = 0.4
        lightBoxViewController.image = transitionFromImageView.image
        
        
    }

}
