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
        
        var randomInputs: Set<InputBuilder> = []
        while randomInputs.count < 100 { randomInputs.insert(.random) }
        
        var randomProperties: [PropertyEnum] = randomInputs.map { .input($0) }

        
//        while randomProperties.count < 25 { randomProperties.append(randomPropertyEnum) }
//        while randomProperties.count < 25 { randomProperties.append(randomPropertyEnum) }
        
        let max: Int = 20

        for x in 0..<max {
            let builder: GameBuilder = .init()
                .withTitle(.random)
                .withRelease(.random)
            var props: [PropertyEnum] = []
            while props.count < 6 {
                let rand: PropertyEnum = randomProperties.randomElement()!
                let isSeries: Bool = InputEnum.series.key.equals(rand.mainBuilder.get(.secondary))
                let hasSeries: Bool = props.contains(where: { InputEnum.series.key.equals($0.mainBuilder.get(.secondary)) })
                if isSeries && hasSeries { }
                else { props.append(rand) }
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
