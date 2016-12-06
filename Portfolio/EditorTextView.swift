//
//  EditorTextView.swift
//  Iceberg
//
//  Created by Michael Volovar on 12/5/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class EditorTextView: UITextView {
    private var row: Int = 0

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setRow (parentRow: Int) {
        row = parentRow
    }

    func getRow () -> Int {
        return row
    }
}
