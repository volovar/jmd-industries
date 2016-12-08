//
//  DetailCellProjectTwo.swift
//  Iceberg
//
//  Created by user on 12/8/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class DetailCellProjectTwo: UITableViewCell {

    
    @IBOutlet weak var projectDetailHeader: UIImageView!
    
    @IBOutlet weak var projectDetailView: UIView!
    
    @IBOutlet weak var projectDescription: UITextView!
    
    @IBOutlet weak var stepsButtonParentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }

}
