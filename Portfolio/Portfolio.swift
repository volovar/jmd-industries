//
//  Portfolio
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import Foundation

class Portfolio {
    var person: Person?
    var title: String?
    var companys: [Company]?
    
    init(person: Person?, title: String?, companys: [Company]?) {
        self.person = person
        self.title = title
        self.companys = companys
    }
}
    
