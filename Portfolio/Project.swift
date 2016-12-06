//
//  Project.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import Foundation
import RealmSwift

class Project: Object {
    dynamic var name = ""
    dynamic var image = ""
    let details = List<Detail>()
}

class Detail: Object {

}
