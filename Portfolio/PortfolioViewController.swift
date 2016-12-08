//
//  PortfolioViewController.swift
//  Iceberg
//
//  Created by Michael Volovar on 11/22/16.
//  Copyright © 2016 JMD Industries. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {
    var fadeTransition: FadeTransition!
    
    // grab the first portfolio from the data
    let portfolio = userData.portfolios[0]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Wireframe items
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Actual app items
    
    // Top: author section
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var authorProfileImageView: UIImageView!
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorTitle: UILabel!
    
    @IBOutlet weak var authorDescription: UITextView!
    
    // Colors
    
    let lightGrey = UIColor(red:180/255.0, green:180/255.0, blue:180/255.0, alpha: 1.0)
    let midGrey = UIColor(red:90/255.0, green:90/255.0, blue:120/255.0, alpha: 1.0)
    let darkGrey = UIColor(red:50/255.0, green:50/255.0, blue:50/255.0, alpha: 1.0)
    
    // Generic text styling items
    
    var authorDescriptionAttributes: [String : Any]!
    
    var companyDescriptionStyle: NSMutableParagraphStyle!
    var companyDescriptionAttributes: [String : Any]!
    
    
    // Author work history
    
    // Facebook
    @IBOutlet weak var facebookTitle: UILabel!
    @IBOutlet weak var facebookDescription: UITextView!
    
    // Yahoo!
    @IBOutlet weak var yahooTitle: UILabel!
    @IBOutlet weak var yahooDescription: UITextView!
    
    // Moovly
    @IBOutlet weak var moovlyTitle: UILabel!
    @IBOutlet weak var moovlyDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        /////////////////////////////////
        ///// Author Images Section /////
        /////////////////////////////////
        
        // Assign hero image
        
        heroImageView.image = UIImage(named: portfolio.coverImage)
        heroImageView.contentMode = UIViewContentMode.scaleAspectFill
        heroImageView.clipsToBounds = true
        
        
        // Author profile image styling
        
        authorProfileImageView.image = UIImage(named: (portfolio.person?.image)!)
        authorProfileImageView.frame.size = CGSize(width: 150, height: 150)
        
        // Create a circle by rounding the corners to half the imageView width
        authorProfileImageView.layer.cornerRadius = (authorProfileImageView.frame.width / 2)
        
        // Horizontally center the imageView by assigning the center.x to be half of the screen-width
        authorProfileImageView.center.x = (UIScreen.main.bounds.width / 2)
        authorProfileImageView.center.y = 195
        
        authorProfileImageView.clipsToBounds = true
        authorProfileImageView.layer.borderWidth = 3
        authorProfileImageView.layer.borderColor = lightGrey.cgColor
        
        
        ///////////////////////////////
        ///// Author Info Section /////
        ///////////////////////////////
        
        // Author name styling
        
        let authorNameAttributedString = NSMutableAttributedString(string: (portfolio.person?.name)!.uppercased())
        
        // Adjust name kerning
        authorNameAttributedString.addAttribute(NSKernAttributeName, value: CGFloat(1.7), range: NSRange(location: 0, length: authorNameAttributedString.length))
        
        authorNameLabel.attributedText = authorNameAttributedString
        authorNameLabel.textColor = darkGrey
        authorNameLabel.font = authorNameLabel.font?.withSize(29)
        
        // Author title/description styling
        
        // Multi-use styling
        let authorDescriptionParagraphStyle = NSMutableParagraphStyle()
        authorDescriptionParagraphStyle.lineSpacing = 1.2
        authorDescriptionParagraphStyle.alignment = NSTextAlignment.center
        
        authorDescriptionAttributes = [NSParagraphStyleAttributeName: authorDescriptionParagraphStyle]
        
        let authorTitleText = portfolio.person?.title
        
        authorTitle.attributedText = NSAttributedString(string: authorTitleText!, attributes: authorDescriptionAttributes)
        authorTitle.font = authorTitle.font?.withSize(18)
        authorTitle.textColor = midGrey
        
        let authorDescriptionText = portfolio.person?.desc
        
        authorDescription.attributedText = NSAttributedString(string: authorDescriptionText!, attributes: authorDescriptionAttributes)
        authorDescription.font = authorDescription.font?.withSize(18)
        authorDescription.textColor = midGrey
        
        
        ///////////////////////////////
        ///// Work history section/////
        ///////////////////////////////
        
        // Global line spacing for company desriptions
        companyDescriptionStyle = NSMutableParagraphStyle()
        companyDescriptionStyle.lineSpacing = 1.5
        companyDescriptionAttributes = [NSParagraphStyleAttributeName: companyDescriptionStyle]
        
        // Facebook
        let facebookDescriptionText = portfolio.companys[0].desc
        styleCompanyParagraphs(companyDescription: facebookDescription, companyDescriptionText: facebookDescriptionText)
        facebookTitle.text = portfolio.companys[0].name
        
        // Yahoo
        let yahooDescriptionText = portfolio.companys[1].desc
        styleCompanyParagraphs(companyDescription: yahooDescription, companyDescriptionText: yahooDescriptionText)
        yahooTitle.text = portfolio.companys[1].name
        
        // Moovly
        let moovlyDescriptionText = portfolio.companys[2].desc
        styleCompanyParagraphs(companyDescription: moovlyDescription, companyDescriptionText: moovlyDescriptionText)
        moovlyTitle.text = portfolio.companys[2].name
        
        // Scroll view
        scrollView.contentSize = CGSize(width: 375, height: 2060)
        
        
    } // end viewDidLoad
    
    // Style text in the company descriptions
    func styleCompanyParagraphs (companyDescription: UITextView!, companyDescriptionText: String!) {
        
        companyDescription.attributedText = NSAttributedString(string: companyDescriptionText, attributes: companyDescriptionAttributes)
        companyDescription.font = companyDescription.font?.withSize(16)
        companyDescription.textColor = darkGrey
        
    } // end styleCompanyDescriptionText
    
    
    
    func setImage (imageView: UIImageView, image: UIImage) {
        
        imageView.image = image
        
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.layer.cornerRadius = 8
        
    } // end setImage
    
    
    
    func addImageShadow (imageSuperView: UIView!) {
        
        imageSuperView.layer.shadowColor = UIColor.black.cgColor
        imageSuperView.layer.shadowOpacity = 0.4
        imageSuperView.layer.shadowOffset = CGSize(width: 0, height: 12)
        imageSuperView.layer.shadowRadius = 12
        
    } // end addImageShadow
    
    
    /////////////////////
    //    transitions
    /////////////////////
    // replace with something nicer
    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // set up a fade transition
        let destination = segue.destination
        fadeTransition = FadeTransition()
        destination.modalPresentationStyle = .custom
        destination.transitioningDelegate = fadeTransition
        fadeTransition.duration = 0.35
        
        // for custom transitions
        if segue.identifier == "segueToDetailsView" {
            print("segue to details")
            
        } else if segue.identifier == "segueToInfoView" {
            print("segue to info")
        }
    }
    
    @IBAction func didTapInfo(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToInfoView", sender: nil)
    }
    
    @IBAction func didTapDetail(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToDetailsView", sender: nil)
    }
    
} // end class

extension PortfolioViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
        
        if indexPath.row == 0 {
            performSegue(withIdentifier: "segueToDetailsView", sender: nil)
        }
    }
}

