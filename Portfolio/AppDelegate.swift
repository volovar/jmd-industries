//
//  AppDelegate.swift
//  Portfolio
//
//  Created by Michael Volovar on 11/9/16.
//  Copyright © 2016 Michael Volovar. All rights reserved.
//

import UIKit

// temporary data model
var mainPortfolio = Resume()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ////////////////////
        // setting up data
        ////////////////////
        mainPortfolio.title = "Main (from fake data)"
        mainPortfolio.person = Person()
        mainPortfolio.person?.name = "Allan Montiero"
        
        let fbCompany = Company()
        fbCompany.name = "Facebook, Inc"
        
        let project1 = Project()
        project1.name = "Facebook Live"
        
        let project2 = Project()
        project2.name = "Education Series"
        
        fbCompany.projects?.append(project1)
        fbCompany.projects?.append(project2)
        mainPortfolio.companys?.append(fbCompany)
        // end data
        
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


}

