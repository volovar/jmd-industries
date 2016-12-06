//
//  EditPortfolioViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/28/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit
import RealmSwift

class EditPortfolioViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var portfolioTitle: UITextField!
    @IBOutlet weak var editorTableView: UITableView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editorTableView.dataSource = self
        editorTableView.delegate = self
        editorTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        portfolioTitle.delegate = self
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
    
    func setupView() {
        portfolioTitle.attributedPlaceholder = NSAttributedString(string: "Portfolio Title", attributes: [NSForegroundColorAttributeName: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)])
        portfolioTitle.text = userData.portfolios.first?.title
    }

    //////////////////////
    // button actions
    //////////////////////
    @IBAction func didTapBack(_ sender: Any) {
        let closeAlert = UIAlertController(title: "Discard Changes?", message: "Closing will undo any changes you have made. Cancel and choose 'Save' if you want to keep your changes.", preferredStyle: .alert)
        
        closeAlert.addAction(UIAlertAction(title: "Discard", style: .destructive, handler: {
            (alert: UIAlertAction) in
                self.view.endEditing(true)
                self.dismiss(animated: true, completion: nil)
        }))
        closeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(closeAlert, animated: true, completion: nil)
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        view.endEditing(true)
        
        dismiss(animated: true, completion: nil)
    }
    
    //////////////////////
    // table view setup
    //////////////////////
    func numberOfSections(in tableView: UITableView) -> Int {
        // incomplete
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (userData.portfolios.first?.companys.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditorTableViewCell", for: indexPath) as! EditorTableViewCell
        let name = cell.nameText as! EditorTextField
        let description = cell.descriptionText as! EditorTextView
        
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        name.text = userData.portfolios.first?.companys[indexPath.row].name
        name.setRow(parentRow: indexPath.row)
        
        description.text = userData.portfolios.first?.companys[indexPath.row].desc
        description.setRow(parentRow: indexPath.row)
        
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

extension EditPortfolioViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        try! realm.write {
            userData.portfolios.first?.title = textField.text!
        }
    }
}

extension EditPortfolioViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (userData.portfolios.first?.companys[collectionView.tag].projects.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectsCollectionViewCell", for: indexPath) as! ProjectsCollectionViewCell
        
        cell.projectTitle.text = userData.portfolios.first?.companys[collectionView.tag].projects[indexPath.row].name
        cell.projectImageView.image = UIImage(named: (userData.portfolios.first?.companys[collectionView.tag].projects[indexPath.row].image)!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}
