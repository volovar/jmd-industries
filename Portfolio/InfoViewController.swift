//
//  InfoViewController.swift
//  Portfolio
//
//  Created by Michael Volovar on 11/9/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit
import AFNetworking

class InfoViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var companySections: [CompanySection] = {
        return CompanySection.companySections()
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 250
        
        
        
        
        // changing mainProject Title Color
        titleLabel.textColor = UIColor.white
        subtitleLabel.textColor = UIColor.white
        
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
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let companySection = companySections[section]
        return companySection.nameOfSection

    }
    
    @IBAction func didPressBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}
