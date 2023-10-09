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
    public func createGame(_ builder: GameBuilder, _ enums: [PropertyEnum] = []) -> Game {
        let game: Game = .init(context: self).update(self, builder)
        return self.buildRelations(game, enums)
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
        let predicate: NSCompoundPredicate = .queryForProperty(builder)
        if let property: Property = self.fetchProperties(predicate).first {
            return property
        } else {
            let property: Property = .init(context: self).set(builder)
            self.store()
            return property
        }
        
    }

}
