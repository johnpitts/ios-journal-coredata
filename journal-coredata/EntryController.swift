//
//  EntryController.swift
//  journal-coredata
//
//  Created by John Pitts on 6/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    //added this comment so i could commit to yesterday's github clone
    
    func saveToPersistentStore() {
        // save model array to persistent CoreData store
        let moc = CoreDataStack.shared.mainContext
        
        do {
            try moc.save()
        } catch {
            moc.reset()
            NSLog("error saving managed object context: \(error)")
        }
    }
    
    func loadFromPersistentStore() -> [Entry] {
        // create NSFetchRequest for Entry objects
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest() // generics go inside < and >
        let moc = CoreDataStack.shared.mainContext
        
        // fetch request on mainContext using do-try-catch
        do {
            return try moc.fetch(fetchRequest)
        } catch {
            NSLog("Error fetching entries: \(error)")
            return []
        }
    }
    
    func createEntry(title: String, bodyText: String) {
        
        let _ = Entry(title: title, bodyText: bodyText)
        saveToPersistentStore()
    }

    func updateEntry(entry: Entry, title: String, bodyText: String) {
        
        entry.title = title
        entry.bodyText = bodyText
        entry.timestamp = Date()
        
        // wouldn't calling Entry(title: title.... do the same thing?)
        
        saveToPersistentStore()
    }
    
    func deleteEntry(entry: Entry) {
        let moc = CoreDataStack.shared.mainContext
        moc.delete(entry)
        
        do {
            try moc.save()
        } catch {
            moc.reset()
            NSLog("error saving managed object context: \(error)")
        }
    }
    

    
    var entries: [Entry] {
        
        return loadFromPersistentStore()
    }
}
