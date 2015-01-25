//
//  DataStore.swift
//  ratings-app
//
//  Created by Ryan Arana on 1/25/15.
//  Copyright (c) 2015 Ryan Arana. All rights reserved.
//

import Foundation
import CoreData



class DataStore {

    let managedObjectContext: NSManagedObjectContext?

    init(storeURL: NSURL, modelURL: NSURL) {

        var moc = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        if let managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL) {
            var error: NSError?
            moc.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
            moc.persistentStoreCoordinator?.addPersistentStoreWithType(
                NSSQLiteStoreType,
                configuration: nil,
                URL: storeURL,
                options: nil,
                error: &error
            )
            
            if let err = error {
                println("Error setting up persistent store: \(err)")
            }
            
            moc.undoManager = NSUndoManager()
        } else {
            println("Error setting up managed object model!")
        }
        managedObjectContext = moc

    }

    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }

}