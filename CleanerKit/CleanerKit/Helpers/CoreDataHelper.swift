//
//  CoreDataHelper.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/09/07.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import CoreData
import RxDataSources
import RxSwift

class CoreDataHelper {
    static var s_type = NSSQLiteStoreType
    static let shared = CoreDataHelper()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
       let modelURL = Bundle.main.url(forResource: "CleanerKit", withExtension: "momd")!
       return NSManagedObjectModel(contentsOf: modelURL)!
    }()

    lazy var applicationDocumentsDirectory: URL = {
       let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
       return urls.last!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator! = {
       var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
       let docURL = self.applicationDocumentsDirectory
       let fileManager = FileManager.default
       let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
       let finalDatabaseURL = documentsUrl.first!.appendingPathComponent("CleanerKit.sqlite")
       do {
           let fileExists = try finalDatabaseURL.checkResourceIsReachable()
           if fileExists == false {
               let documentsURL = Bundle.main.resourceURL?.appendingPathComponent("CleanerKit.sqlite")
               try fileManager.copyItem(atPath: (documentsURL?.path)!, toPath: finalDatabaseURL.path)
           }
       } catch let error as NSError {
           print("path : \(finalDatabaseURL.path) error : \(error)")
       }
       
       let mOptions = [NSMigratePersistentStoresAutomaticallyOption: true,
                       NSInferMappingModelAutomaticallyOption: true]
       
       do {
        try coordinator!.addPersistentStore(ofType: CoreDataHelper.s_type, configurationName: nil, at: finalDatabaseURL, options: nil)

       } catch {
           coordinator = nil
           abort()
       }
       
       return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
       let coordinator = self.persistentStoreCoordinator
       var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
       managedObjectContext.persistentStoreCoordinator = coordinator
       return managedObjectContext
    }()

}
