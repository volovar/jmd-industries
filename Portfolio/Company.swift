//
//  Company.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import Foundation

class Company {
    var name: String
    var description: String
    var projects: [Project]?
    
    init(name: String, description: String, projects: [Project]?) {
        self.name = name
        self.description = description
        self.projects = projects
    }
}
