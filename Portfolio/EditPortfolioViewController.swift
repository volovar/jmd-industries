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
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorTitle: UILabel!
    @IBOutlet weak var authorDescription: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
    
    let realm = try! Realm()
    let portfolio = userData.portfolios[0]
    
    // colors
    let lightGrey = UIColor(red:180/255.0, green:180/255.0, blue:180/255.0, alpha: 1.0)
    let midGrey = UIColor(red:90/255.0, green:90/255.0, blue:120/255.0, alpha: 1.0)
    let darkGrey = UIColor(red:50/255.0, green:50/255.0, blue:50/255.0, alpha: 1.0)
    
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
        scrollView.contentSize = scrollContentView.frame.size
        
        portfolioTitle.attributedPlaceholder = NSAttributedString(string: "Portfolio Title", attributes: [NSForegroundColorAttributeName: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)])
        portfolioTitle.text = userData.portfolios.first?.title
        
        // set author image
        authorImage.image = UIImage(named: (userData.portfolios.first?.person?.image)!)
        // Create a circle by rounding the corners to half the imageView width
        authorImage.layer.cornerRadius = (authorImage.frame.width / 2)
        
        // Horizontally center the imageView by assigning the center.x to be half of the screen-width
        authorImage.center.x = (UIScreen.main.bounds.width / 2)
        authorImage.center.y = 195
        
        authorImage.clipsToBounds = true
        authorImage.layer.borderWidth = 3
        authorImage.layer.borderColor = lightGrey.cgColor
        
        // Author name styling
        let authorNameAttributedString = NSMutableAttributedString(string: (portfolio.person?.name)!.uppercased())
        
        // Adjust name kerning
        authorNameAttributedString.addAttribute(NSKernAttributeName, value: CGFloat(1.7), range: NSRange(location: 0, length: authorNameAttributedString.length))
        
        authorName.attributedText = authorNameAttributedString
        authorName.textColor = darkGrey
        authorName.font = authorName.font?.withSize(29)
        
        // Author title/description styling
        
        // Multi-use styling
        let authorDescriptionParagraphStyle = NSMutableParagraphStyle()
        authorDescriptionParagraphStyle.lineSpacing = 1.2
        authorDescriptionParagraphStyle.alignment = NSTextAlignment.center
        
        let authorDescriptionAttributes = [NSParagraphStyleAttributeName: authorDescriptionParagraphStyle]
        
        let authorTitleText = portfolio.person?.title
        
        authorTitle.attributedText = NSAttributedString(string: authorTitleText!, attributes: authorDescriptionAttributes)
        authorTitle.font = authorTitle.font?.withSize(18)
        authorTitle.textColor = midGrey
        
        let authorDescriptionText = portfolio.person?.desc
        
        authorDescription.attributedText = NSAttributedString(string: authorDescriptionText!, attributes: authorDescriptionAttributes)
        authorDescription.font = authorDescription.font?.withSize(18)
        authorDescription.textColor = midGrey
        
        // set portfolio cover image
        coverImage.image = UIImage(named: (userData.portfolios.first?.coverImage)!)
    }

    //////////////////////
    // button actions
    //////////////////////
    @IBAction func didTapClose(_ sender: UIButton) {
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
    
    @IBAction func didTapBack(_ sender: Any) {
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
        
        let companyDescriptionStyle = NSMutableParagraphStyle()
        companyDescriptionStyle.lineSpacing = 1.5
        let companyDescriptionAttributes = [NSParagraphStyleAttributeName: companyDescriptionStyle]
        
        description.attributedText = NSAttributedString(string: (userData.portfolios.first?.companys[indexPath.row].desc)!, attributes: companyDescriptionAttributes)
        description.font = description.font?.withSize(16)
        description.textColor = darkGrey
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
        
        cell.clippingContainer.layer.cornerRadius = 4
        cell.layer.cornerRadius = 4
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowRadius = 4
        cell.layer.shadowOffset = CGSize.zero
        cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
        cell.layer.shouldRasterize = true
        
        cell.projectTitle.text = userData.portfolios.first?.companys[collectionView.tag].projects[indexPath.row].name
        cell.projectImageView.image = UIImage(named: (userData.portfolios.first?.companys[collectionView.tag].projects[indexPath.row].image)!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}
