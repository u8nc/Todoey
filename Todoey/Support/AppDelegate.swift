//
//  AppDelegate.swift
//  Todoey
//
//  Created by luobote on 11/10/18.
//  Copyright © 2018 u8nc. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
//        print("App resigned Active")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
//        print("App entered background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
//        print("App enetered foreground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
//        print("App became Active")
    }

    func applicationWillTerminate(_ application: UIApplication) {
 
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
   
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
           
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
          
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }


}

