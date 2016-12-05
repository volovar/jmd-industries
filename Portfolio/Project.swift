//
//  Project.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class Project {
    var name: String
    var image: UIImage?
    var details: [Detail]?
    
    init?(name: String, image: UIImage?, details: [Detail]?) {
        self.name = name
        self.image = image
        self.details = details
        
        if name.isEmpty {
            return nil
        }
    }
}

class Detail {

}
