//
//  AppDelegate.swift
//  czechitas-mobile-app
//
//  Created by Svetlana Margetová on 06.06.16.
//  Copyright © 2016 Svetlana Margetová. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        Model.sharedInstance.fetchCourseData(APIRouter.coursesOpen(), courseData: {
            (data, data2) -> Void in
        })
        Model.sharedInstance.fetchCourseData(APIRouter.coursesPrepared(), courseData: {
            (data, data2) -> Void in
        })
        
        Model.sharedInstance.fetchCourseData(APIRouter.coursesClosed(), courseData: {
            (data, data2) -> Void in
        })

        UINavigationBar.appearance().barStyle = .blackTranslucent
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
      
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
            }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also     }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let defaults = UserDefaults.standard
        let defaultValue = ["Courses" : [[String:Int]]()]
        defaults.register(defaults: defaultValue)
    }


}
}
