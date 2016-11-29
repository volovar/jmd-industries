//
//  headerTableViewCell.swift
//  Iceberg
//
//  Created by user on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class headerTableViewCell: UITableViewCell {

    @IBOutlet weak var headerBackground: UIImageView!
    
    @IBOutlet weak var headerTitle: UILabel!
    
    @IBOutlet weak var headerDate: UILabel!
    
    func setupCell(image: UIImage, titleLabelText: String, dateOnHeader: String) {
        headerBackground.image = image
         headerTitle.text = titleLabelText
        headerDate.text = dateOnHeader
        
    }

    
    
        
    }



