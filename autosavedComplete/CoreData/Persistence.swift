//
//  Persistence.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    static var randomPropertyEnum: PropertyEnum {
        switch PrimaryEnum.random {
        case .input: return .input(.random)
        case .mode: return .mode(.random)
        default: return .platform(.random, .random)
        }
    }
    
    static var propertyBuilders: [PropertyBuilder] {
        [
            InputBuilder(.series, "Grand Theft Auto"),
            ModeBuilder(.single),
            FormatBuilder(.digital(.nintendo)),
            FormatBuilder(.physical(.cartridge)),
            PlatformBuilder(.playstation(.ps3)),
            PlatformBuilder(.pc(.mac))
        ]
    }

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let max: Int = 10
        
        for _ in 0..<max {
            let builder: GameBuilder = .init()
                .withDisplay(.random)
                .withRelease(.random)
            viewContext.buildGame(builder, [randomPropertyEnum])
        }
        
       
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "autosavedComplete")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
}
