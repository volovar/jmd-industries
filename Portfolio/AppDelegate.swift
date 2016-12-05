//
//  AppDelegate.swift
//  Portfolio
//
//  Created by Michael Volovar on 11/9/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

// temporary data model
var mainPortfolio = Portfolio(person: nil, title: "", companys: [])

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // call function to set portfolio data
        setupData()
        
        // app page control style
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.5882352941, green: 0.6117647059, blue: 0.6, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.3882352941, green: 0.7882352941, blue: 0.8431372549, alpha: 1)
        
        // app nav bar style
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = #colorLiteral(red: 0.1568627451, green: 0.1725490196, blue: 0.231372549, alpha: 0)
        navBar.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1725490196, blue: 0.231372549, alpha: 0)
        navBar.tintColor = UIColor.white
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func setupData() {
        ////////////////////
        // setting up data
        ////////////////////
        
        let person = Person(name: "Allan Montiero", title: "Product Designer", description: "Senior mobile designer, specializing in new feature development. Research, prototype, learn, build. Formerly at Facebook, Yahoo!, and Moovly.")
        var companys: [Company] = []
        
        // first company
        let fbCompany = Company(name: "Facebook, Inc", description: "Helped design Facebook Live. Led a team of 3 designers on a 3-month expedition to research global usage of the Like button. Worked with top-level executives to create an in-house design educational series.", projects: [])
        
        // second company
        let yahooCompany = Company(name: "Yahoo", description: "Worked with VP of Product to design a new sleep tracker feature. Updated large portions of Yahoo! Answers to conform with modern design principles. Increased overall engagement by 6% through implementing cutting-edge information architecture techniques.", projects: [])
        
        // third company
        let moovlyCompany = Company(name: "Moovly", description: "Built an app for bovine relocation services. App summons relocator trucks to any spot in the world, inlcuding Antarctica. Adoption was nearly 100% in Central California. Incporporated tag-tracking and hoof-print ID to ensure cows were never lost.", projects: [])
        
        // first company projects
        let fbProject1 = Project(name: "Facebook Live", image: #imageLiteral(resourceName: "facebook_live"), details: [])
        let fbProject2 = Project(name: "Education Series", image: #imageLiteral(resourceName: "education_series"), details: [])
        
        // second company projects
        let yahooProject1 = Project(name: "Yahoo Sleep Tracker", image: #imageLiteral(resourceName: "sleep_tracker"), details: [])
        
        // third company projects
        let moovlyProject1 = Project(name: "Moovly", image: #imageLiteral(resourceName: "moovly"), details: [])
        
        // add projects to companies
        fbCompany.projects?.append(fbProject1!)
        fbCompany.projects?.append(fbProject2!)
        yahooCompany.projects?.append(yahooProject1!)
        moovlyCompany.projects?.append(moovlyProject1!)
        
        companys.append(fbCompany)
        companys.append(yahooCompany)
        companys.append(moovlyCompany)
        
        // add companies to portfolio
        mainPortfolio.person = person
        mainPortfolio.title = "Main"
        mainPortfolio.companys = companys
    }


}

