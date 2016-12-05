//
//  EditorTableViewCell.swift
//  Iceberg
//
//  Created by Michael Volovar on 12/4/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class EditorTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
