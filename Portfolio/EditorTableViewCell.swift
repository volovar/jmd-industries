//
//  EditorTableViewCell.swift
//  Iceberg
//
//  Created by Michael Volovar on 12/4/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit
import RealmSwift

class EditorTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let realm = try! Realm()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        descriptionText.delegate = self
        nameText.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        let color = UIColor.clear
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.backgroundColor = color
            self.backgroundColor = color
        }
        
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let color = UIColor.clear
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            contentView.backgroundColor = color
            self.backgroundColor = color
        }
        
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = forRow
        collectionView.reloadData()
    }

}

extension EditorTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let field = textField as! EditorTextField
        
        try! realm.write {
            userData.portfolios.first?.companys[field.getRow()].name = field.text!
        }
    }
}

extension EditorTableViewCell: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        let view = textView as! EditorTextView
        
        try! realm.write {
            userData.portfolios.first?.companys[view.getRow()].desc = view.text
        }
    }
}
