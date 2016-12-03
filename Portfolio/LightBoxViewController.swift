//
//  LightBoxViewController.swift
//  Iceberg
//
//  Created by user on 11/30/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class LightBoxViewController: UIViewController, LightBoxTransitionDismissDelegate {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var lightBoxBG: UIView!
    @IBOutlet weak var lightBoxImageView: UIImageView!
    @IBOutlet weak var transitionToImageView: UIImageView!

    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    @IBOutlet weak var descriptionBox: UIView!
    var image: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lightBoxImageView.image = image
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapDIsmissLightBox(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("tapped lightbox")
    }
    
    

    func imageViewForTapped() -> UIImageView {
        return   transitionToImageView

    }
    
    @IBAction func tapLightBoxPhoto(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
