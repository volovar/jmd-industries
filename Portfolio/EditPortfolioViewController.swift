//
//  EditPortfolioViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class EditPortfolioViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var portfolioTitle: UILabel!
    @IBOutlet weak var editorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editorTableView.dataSource = self
        editorTableView.delegate = self
        
        setupView()
    }
    
    func setupView() {
        portfolioTitle.text = mainPortfolio.title
    }

    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // incomplete
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainPortfolio.companys!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditorTableViewCell", for: indexPath) as! EditorTableViewCell
        
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        cell.nameText.text = mainPortfolio.companys?[indexPath.row].name
        cell.descriptionText.text = mainPortfolio.companys?[indexPath.row].description
        
        return cell
    }
    
    // set background color to white and de-select the cell upon selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.white
        selectedCell.setSelected(false, animated: false)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.white
        
        if cell.isSelected {
            cell.setSelected(false, animated: false)
        }
    }
}

extension EditPortfolioViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (mainPortfolio.companys?[collectionView.tag].projects?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectsCollectionViewCell", for: indexPath) as! ProjectsCollectionViewCell
        
        cell.projectTitle.text = mainPortfolio.companys?[collectionView.tag].projects?[indexPath.row].name
        cell.projectImageView.image = mainPortfolio.companys?[collectionView.tag].projects?[indexPath.row].image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}
