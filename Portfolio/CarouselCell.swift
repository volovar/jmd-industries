//
//  CarouselCell.swift
//  Iceberg
//
//  Created by user on 12/4/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class CarouselCell: UITableViewCell {

    @IBOutlet weak var carouselContainer: iCarousel!
    
       var numbers = [Int]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        numbers = [1,2,3,4,5,6]

    }

    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 4
    }
    
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        var button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button .setTitle("\(index)", for: .normal)
        button.backgroundColor = UIColor.red
        tempView.addSubview(button)
        
        
        
        return tempView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing {
            return 0.5
        }
        return value
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }

}
