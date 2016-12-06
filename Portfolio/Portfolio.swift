//
//  Portfolio
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import Foundation
import RealmSwift

class Portfolio: Object {
    dynamic var person: Person?
    dynamic var title = ""
    let companys = List<Company>()
}
    
