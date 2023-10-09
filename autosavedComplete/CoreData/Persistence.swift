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
    
//    static var propertyBuilders: [PropertyBuilder] {
//        [
//            InputBuilder(.series, "Grand Theft Auto"),
//            ModeBuilder(.single),
//            FormatBuilder(.digital(.nintendo)),
//            FormatBuilder(.physical(.cartridge)),
//            PlatformBuilder(.playstation(.ps3)),
//            PlatformBuilder(.pc(.mac))
//        ]
//    }

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        var randomProperties: [PropertyEnum] = []
        while randomProperties.count < 25 { randomProperties.append(randomPropertyEnum) }
        
        let max: Int = 10

        for x in 0..<max {
            let builder: GameBuilder = .init()
                .withTitle(.random)
                .withRelease(.random)
            var props: [PropertyEnum] = []
            while props.count < 3 {
                let rand: PropertyEnum = randomProperties.randomElement()!
                if !InputEnum.series.key.equals(rand.mainBuilder.get(.secondary)) {
                    props.append(.input(.random))
                }
            }
            viewContext.createGame(builder, props)
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
