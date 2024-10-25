//
//  CoreDataStack.swift
//  tmdb
//
//  Created by Aulia Octaviani on 25/10/24.

// Data/CoreDataStack.swift

import Foundation
import CoreData

public class CoreDataStack {
    public static let shared = CoreDataStack()
    
    public let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "TMDBModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    public var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
