//
//  Person.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

class Person {
    var name: String
    var title: String?
    var description: String?
    
    init(name: String, title: String?, description: String?) {
        self.name = name
        self.title = title
        self.description = description
    }
}
