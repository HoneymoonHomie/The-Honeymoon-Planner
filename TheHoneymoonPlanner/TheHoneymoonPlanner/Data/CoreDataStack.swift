//
//  CoreDataStack.swift
//  TheHoneymoonPlanner
//
//  Created by Brandi Bailey on 2/2/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    //MARK: - Core Data Stack
    
    private init() {}
       static var context: NSManagedObjectContext {
           return persistentContainer.viewContext
       }
       static var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "TheHoneymoonPlanner" )
           container.loadPersistentStores(completionHandler: { (storeDescription, error) in
               if let error = error as NSError? {
                   print("Unresolved error \(error), \(error.userInfo)")
               }
           })
           return container
       }()
       // MARK: - Core Data Saving support
       static func saveContext () {
           let context = persistentContainer.viewContext
           if context.hasChanges {
               do {
                   try context.save()
                   print("SAVED!!!")
               } catch {
                   let nserror = error as NSError
                   print("Unresolved error \(nserror), \(nserror.userInfo)")
               }
           }
       }
    
//    static let shared = CoreDataStack()
//
//    private init() {}
//
//    lazy var container: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "TheHoneymoonPlanner")
//        container.loadPersistentStores(completionHandler: { _, error in
//            if let error = error {
//                fatalError("Failed to load persistent store: \(error)")
//            }
//        })
//        // May need to be disabled if dataset is too large for performance reasons
//        container.viewContext.automaticallyMergesChangesFromParent = true
//        return container
//    }()
//    var mainContext: NSManagedObjectContext {
//        return container.viewContext
//    }
//
//    func saveContext(context: NSManagedObjectContext) throws {
//        //Placeholder in case something doesn't work
//        var closureError: Error?
//        context.performAndWait {
//            do {
//                try context.save()
//                print("SAVED!!!")
//            } catch {
//                NSLog("error saving moc: \(error)")
//                closureError = error
//            }
//        }
//        if let error = closureError {
//            throw error
//        }
//    }
}

//extension NSManagedObjectContext {
//    static let mainContext = CoreDataStack.shared.mainContext
//}



