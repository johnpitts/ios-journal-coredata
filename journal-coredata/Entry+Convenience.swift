//
//  Entry+Convenience.swift
//  journal-coredata
//
//  Created by John Pitts on 6/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    
    convenience init(title: String, bodyText: String?, timestamp: Date = Date() , identifier: String = "", context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.identifier = identifier
    }
    
    
}
