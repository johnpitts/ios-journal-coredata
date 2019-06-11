//
//  CoreDataStack.swift
//  journal-coredata
//
//  Created by John Pitts on 6/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = { // computed property
        
        let container = NSPersistentContainer(name: "journal-coredata")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores \(error)")
            }
        }
        return container
        
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
}
