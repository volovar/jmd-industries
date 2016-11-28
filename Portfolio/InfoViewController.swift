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
    
    

    var companySections: [CompanySection] = {
        
        return CompanySection.companySections()
    }()
    

    let sectionTitles: [String] = ["Facebook Projects", "Yahoo Projects", "Moovly Projects"]
    let sectionHeaderImages: [UIImage] = [#imageLiteral(resourceName: "titleCompressedBlue"), #imageLiteral(resourceName: "titleCompressedGreen"), #imageLiteral(resourceName: "titleCompressedPink"), #imageLiteral(resourceName: "titleCompressedRuby"), #imageLiteral(resourceName: "titleCompressedPurple")]
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        tableView.sectionIndexColor = UIColor.blue
        self.navigationItem.title = "Company Projects"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigationBar"),for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]


        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 250
//        tableView.backgroundColor = UIColor.clear
        
        
        // changing mainProject Title Color
        titleLabel.textColor = UIColor.white
        subtitleLabel.textColor = UIColor.white
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(tableView.contentOffset.y)

    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>){
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
        
        cell.setupCell(image: sectionHeaderImages[section], titleLabelText: sectionTitles[section])


        return cell
    }
    
    
      func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }


    
    
    
    
    @IBAction func didPressBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}
