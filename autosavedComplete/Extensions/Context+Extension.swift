//
//  Context+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation
import CoreData
import SwiftUI

public typealias Context = NSManagedObjectContext

extension Context {
    
    @discardableResult
    public func store() -> Bool {
        do {
            try self.save()
            return true
        } catch {
            self.rollback()
            return false
        }
    }
    
}

extension Context {
    
    @discardableResult
    private func buildRelation(_ g: UUID, _ prop: PropertyEnum) -> Relation {
        let primary: UUID = self.fetchProperty(prop.mainBuilder).identity
        let secondary: UUID? = self.fetchProperty(prop.subBuilder)?.identity
        let relation: Relation = .init(context: self).update(g, primary, secondary)
        self.store()
        return relation
    }
    
    @discardableResult
    private func buildRelations(_ game: Game, _ properties: [PropertyEnum]) -> Game {
        let g: UUID = game.identity
        properties.forEach { self.buildRelation(g, $0) }
        self.store()
        return game
    }
 
}

extension Context {
    
    @discardableResult
    public func createGame(_ builder: GameBuilder, _ col: PropertyCollection) -> Game {
        self.createGame(builder, col.allEnums)
    }

    @discardableResult
    public func createGame(_ builder: GameBuilder, _ properties: [PropertyEnum]) -> Game {
        let game: Game = .init(context: self).update(self, builder)
        return self.buildRelations(game, properties)
    }
    
    @discardableResult
     public func fetchGames(_ p: NSPredicate?, _ s: [NSSortDescriptor]? = nil) -> [Game] {
         let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
         fetchRequest.predicate = p
         fetchRequest.sortDescriptors = s
         return (try? self.fetch(fetchRequest)) ?? .init()
     }
     
     @discardableResult
     func queryGame(_ builder: GameBuilder) -> Game? {
         let predicate: NSCompoundPredicate = .queryForGame(builder)
         return self.fetchGames(predicate).first ?? nil
     }
    
}

extension Context {
    
    @discardableResult
    private func fetchProperties(_ relation: Relation) -> (Property?, Property?) {
        let primary: Property? = self.fetchProperty(relation.get(.primary))
        let secondary: Property? = self.fetchProperty(relation.get(.secondary))
        return (primary, secondary)
    }
    
    @discardableResult
    public func getPropertiesByRelations(_ relations: FetchedResults<Relation>) -> [PropertyEnum] {
        let properties: [(Property?, Property?)] = relations.map(self.fetchProperties)
        return properties.map { tuple in
            let primary: Property = tuple.0!
            if let secondary: Property = tuple.1 {
                return .platform(.init(primary), .init(secondary))
            } else {
                if primary.primaryEnum == .mode {
                    return .mode(.init(primary))
                } else { return .input(.init(primary)) }
            }
        }
    }
    
    @discardableResult
    public func fetchProperties(_ p: NSPredicate, _ s: [NSSortDescriptor]? = nil) -> [Property] {
        let fetchRequest: NSFetchRequest<Property> = Property.fetchRequest()
        fetchRequest.predicate = p
        fetchRequest.sortDescriptors = s
        return (try? self.fetch(fetchRequest)) ?? .init()
    }
    
    @discardableResult
    public func fetchProperty(_ uuid: UUID?) -> Property? {
        if let id: UUID = uuid {
            let predicate: NSPredicate = .init(.identity, id, .equal)
            if let property: Property = self.fetchProperties(predicate).first {
                return property
            }
        }
        
        return nil
    }
    
    @discardableResult
    public func fetchProperty(_ builder: PropertyBuilder?) -> Property? {
        if let b: PropertyBuilder = builder { return self.fetchProperty(b) }
        else { return nil }
    }
    
    @discardableResult
    public func fetchProperty(_ builder: PropertyBuilder) -> Property {
        if let property: Property = self.queryProperty(builder) {
            return property
        } else {
            let property: Property = .init(context: self).set(builder)
            self.store()
            return property
        }
    }
    
    @discardableResult
    public func queryProperty(_ builder: PropertyBuilder) -> Property? {
        let predicate: NSCompoundPredicate = .queryForProperty(builder)
        if let property: Property = self.fetchProperties(predicate).first {
            return property
        } else { return nil }
    }
    
//    @discardableResult
//    public func fetchProperty(_ string: String) -> Property? {
//        let str: String = string.trimmed
//        if !str.isEmpty {
//            
//        }
//        
//        return nil
//        
////        let predicate: NSCompoundPredicate = .queryForProperty(builder)
////        if let property: Property = self.fetchProperties(predicate).first {
////            return property
////        } else {
////            let property: Property = .init(context: self).set(builder)
////            self.store()
////            return property
////        }
//        
//    }
    
    @discardableResult
    func fetchProperties(_ i: InputEnum, _ str: Binding<String>) -> [Property] {
        let canon: String = str.wrappedValue.canonicalized
        let count: Int = canon.count
        let p1: NSPredicate = .init(.secondary, i.key, .equal)

        var predicate2: NSPredicate? {
            switch count {
            case 0: return nil
            case 1: return .init(.search, canon, .begin)
            default: return .init(.search, canon, .contain)
            }
        }
        
        var predicate: NSPredicate {
            if let p2: NSPredicate = predicate2 {
                return NSCompoundPredicate(andPredicateWithSubpredicates: [p1, p2])
            } else { return p1 }
        }
        
        let sort: [NSSortDescriptor] = [.init(keyPath: Property.DisplayKeyPath, ascending: true)]
        return self.fetchProperties(predicate, sort)
    }

}
