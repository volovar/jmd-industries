//
//  UserData.swift
//  Iceberg
//
//  Created by Michael Volovar on 12/6/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import Foundation
import RealmSwift

class UserData: Object {
    dynamic var person: Person?
    let portfolios = List<Portfolio>()
}
