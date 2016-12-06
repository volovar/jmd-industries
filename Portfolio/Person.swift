//
//  Person.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    dynamic var name = ""
    dynamic var title = ""
    dynamic var desc = ""
}
