//
//  CoreDataStack.swift
//  tmdb
//
//  Created by Aulia Octaviani on 25/10/24.

// Data/CoreDataStack.swift
// fungsi dari corestack ini adalah mengelola core - data
import Foundation
import CoreData

public class CoreDataStack {
    // dibuat statis agar mudah dipanggil di tempat lain
    public static let shared = CoreDataStack()
    
    public let persistentContainer: NSPersistentContainer
    
    private init() {
        // pada bagian ini namanya harus sama dengan nama model yang dibuat
        persistentContainer = NSPersistentContainer(name: "TMDBModel")
        // digunakan untuk memuat penyimpanan
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
