//
//  Company.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import Foundation
import RealmSwift

class Company: Object {
    dynamic var name = ""
    dynamic var desc = ""
    let projects = List<Project>()
}
