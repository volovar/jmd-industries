	//
//  InfoViewController.swift
//  Portfolio
//
//  Created by Michael Volovar on 11/9/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit
import AFNetworking


class InfoViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var measureIndexBg: UIImageView!
    
    @IBOutlet weak var measureIndexBGSct1: UIImageView!
    
    @IBOutlet weak var measureIndexBGSct2: UIImageView!
    
    @IBOutlet weak var measureIndex: UIImageView!
    var companySections: [CompanySection] = {
        
        return CompanySection.companySections()
    }()
    
    
    let sectionHeaderImages: [UIImage] = [#imageLiteral(resourceName: "titleCompressedBlue"), #imageLiteral(resourceName: "titleCompressedGreen"), #imageLiteral(resourceName: "titleCompressedPink"), #imageLiteral(resourceName: "titleCompressedRuby"), #imageLiteral(resourceName: "titleCompressedPurple")]
    let sectionTitles: [String] = ["Facebook Projects", "Yahoo Projects", "Moovly Projects"]
    let sectionHeaderDates: [String] = ["2015 | 2016","2013 | 2015", "2011 | 2013"]
    
    
    var measureIndexOriginalY: CGFloat!


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        measureIndexOriginalY = measureIndex.frame.origin.y

        
        
        
        tableView.sectionIndexColor = UIColor.blue
        self.navigationItem.title = "Company Projects"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigationBar"),for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 275
                tableView.backgroundColor = UIColor.clear
        
        
        // changing mainProject Title Color
        titleLabel.textColor = UIColor.white
        subtitleLabel.textColor = UIColor.white
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(tableView.contentOffset.y)
        self.measureIndex.frame.origin.y = self.measureIndexOriginalY - (tableView.contentOffset.y*2.5)
        
        let blueBGopacity = convertValue(inputValue: CGFloat(tableView.contentOffset.y), r1Min: 335, r1Max: 600, r2Min: 1, r2Max: 0)
        measureIndexBg.alpha = blueBGopacity
        let greenBGopacity = convertValue(inputValue: CGFloat(tableView.contentOffset.y), r1Min: 335, r1Max: 615, r2Min: 0, r2Max: 1)
        measureIndexBGSct1.alpha = greenBGopacity
        
        let pinkBGOpacity = convertValue(inputValue: CGFloat(tableView.contentOffset.y), r1Min: 800, r1Max: 1200, r2Min: 0, r2Max: 1)
        measureIndexBGSct2.alpha = pinkBGOpacity
        

        

        
        
        
    }

    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return companySections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let companySection = companySections[section]
        return companySection.projects.count
        
        //        return companySections.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectsDataCell") as! ProjectsDataCell
        let companySection = companySections[indexPath.section]
        let project = companySection.projects[indexPath.row]
        
        
        
        cell.project = project
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! headerTableViewCell
        
        cell.setupCell(image: sectionHeaderImages[section], titleLabelText: sectionTitles[section], dateOnHeader: sectionHeaderDates[section])

        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    
    
    
    @IBAction func didPressBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}
