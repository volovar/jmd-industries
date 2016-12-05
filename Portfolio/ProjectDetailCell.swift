//
//  ProjectDetailCell.swift
//  Iceberg
//
//  Created by user on 12/4/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class ProjectDetailCell: UITableViewCell {


    @IBOutlet weak var projectDetailHeader: UIImageView!
    
    @IBOutlet weak var projectDetailView: UIView!
    
    @IBOutlet weak var projectDescription: UITextView!
    
    @IBOutlet weak var stepsButtonParentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
