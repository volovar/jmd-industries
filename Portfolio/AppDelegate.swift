//
//  AppDelegate.swift
//  Portfolio
//
//  Created by Michael Volovar on 11/9/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit
import RealmSwift

// temporary data model
var userData: UserData!

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
        let realm = try! Realm()
        
        //!!!!!!!!!!!!!!!!!
        //!!!! DANGER
        //!!!! uncomment the section below if you want to delete(!) all data and recreate it
        //!!!! after uncommenting, build and run the app once to delete and recreate the data
        //!!!! comment the section out again once the new data is created
        //!!!! this is only for development / test purposes, should be removed later
        //!!!!!!!!!!!!!!!!!
        //try! realm.write {
        //    realm.deleteAll()
        //}
        //!!!!!!!!!!!!!!!!!
        
        if realm.objects(UserData.self).count > 0 {
            userData = realm.objects(UserData.self).first
        } else {
            firstTimeDataSetup()
        }
    }

    func firstTimeDataSetup() {
        // setup sample data
        let realm = try! Realm()
        userData = UserData()
        
        try! realm.write {
            realm.add(userData)
        }
        
        let person = Person(value: ["name": "Allan Montiero", "title": "Product Designer", "desc": "Senior mobile designer, specializing in new feature development. Research, prototype, learn, build. Formerly at Facebook, Yahoo!, and Moovly."])
        
        let portfolio = Portfolio(value: ["title": "Main"])
        
        // first company
        let fbCompany = Company(value: ["name": "Facebook, Inc", "desc": "Helped design Facebook Live. Led a team of 3 designers on a 3-month expedition to research global usage of the Like button. Worked with top-level executives to create an in-house design educational series."])
        
        // second company
        let yahooCompany = Company(value: ["name": "Yahoo", "desc": "Worked with VP of Product to design a new sleep tracker feature. Updated large portions of Yahoo! Answers to conform with modern design principles. Increased overall engagement by 6% through implementing cutting-edge information architecture techniques."])
        
        // third company
        let moovlyCompany = Company(value: ["name": "Moovly", "desc": "Built an app for bovine relocation services. App summons relocator trucks to any spot in the world, inlcuding Antarctica. Adoption was nearly 100% in Central California. Incporporated tag-tracking and hoof-print ID to ensure cows were never lost."])
        
        // first company projects
        let fbProject1 = Project(value: ["name": "Facebook Live", "image": "facebook_live"])
        let fbProject2 = Project(value: ["name": "Education Series", "image": "education_series"])
        let fbProject3 = Project(value: ["name": "Project 3", "image": "facebook_live"])
        
        // second company projects
        let yahooProject1 = Project(value: ["name": "Yahoo Sleep Tracker", "image": "sleep_tracker"])
        
        // third company projects
        let moovlyProject1 = Project(value: ["name": "Moovly", "image": "moovly"])
        
        
        try! realm.write {
            fbCompany.projects.append(fbProject1)
            fbCompany.projects.append(fbProject2)
            fbCompany.projects.append(fbProject3)
            
            yahooCompany.projects.append(yahooProject1)
            
            moovlyCompany.projects.append(moovlyProject1)
            
            portfolio.companys.append(fbCompany)
            portfolio.companys.append(yahooCompany)
            portfolio.companys.append(moovlyCompany)
            
            portfolio.person = person
            
            userData.person = person
            userData.portfolios.append(portfolio)
        }

    }

}

