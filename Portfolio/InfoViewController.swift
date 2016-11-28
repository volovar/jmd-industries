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

//    var header: [CustomHeader] = {
//        return CustomHeader.sectionTitles
//    }
//    
    
    let sectionTitles: [String] = ["comp", "Moovly Projects"]
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Company Projects"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigationBar"),for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]


        
        
        tableView.dataSource = self
        tableView.rowHeight = 250
//        tableView.backgroundColor = UIColor.clear
        

        
        
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
    
//  
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
//
                    let companySection = companySections[section]
        
                    return companySection.nameOfSection

    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        var companySection = companySections[section]
//        
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 360, height: 50))
//        
//        
//        
//        if(section == 0){
//            headerView.backgroundColor = UIColor.blue
//            
//        } else if (section == 1){
//            headerView.backgroundColor = UIColor.green
//
//        }
//        tableView.addSubview(headerView)
//        return headerView
//    }
    
    
    
//       //    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        
//        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
//        header.contentView.backgroundColor = UIColor(red: 238/255, green: 168/255, blue: 15/255, alpha: 0.8)
//        header.textLabel?.textColor = UIColor.white
//        header.alpha = 1
//    }
    
    private  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }


    
    
    
    
    @IBAction func didPressBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}
