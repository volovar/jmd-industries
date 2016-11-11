//
//  HomeViewController.swift
//  Portfolio
//
//  Created by Michael Volovar on 11/9/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = homeImageView.frame.size
    }
    
    // Devon's comment

}
