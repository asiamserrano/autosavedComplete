//
//  Context+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation
import CoreData

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
    private func buildRelation(_ g: GameBuilder, _ b1: PropertyBuilder, _ b2: PropertyBuilder? = nil) -> Relation {
        let relation: Relation = .init(context: self).update(g.identity, b1.identity, b2?.identity)
        self.store()
        return relation
    }
    
    private func buildRelation(_ g: GameBuilder, _ builders: [PropertyBuilder]) -> Relation {
        let first: PropertyBuilder = builders[0]
        return builders.count == 1 ? buildRelation(g, first) : buildRelation(g, first, builders[1])
    }
    
}
extension Context {

    @discardableResult
    func buildGame(_ builder: GameBuilder, _ enums: [PropertyEnum] = []) -> Game {
        enums.forEach { propEn in
            let builders: [PropertyBuilder] = propEn.builders
            let _: Relation = buildRelation(builder, builders)
            let _: [Property] = builders.map(fetchProperty)
        }
        
        let game: Game = .init(context: self).update(self, builder)
        self.store()
        return game
    }
    
}

extension Context {
    
    @discardableResult
    private func fetchProperties(_ p: NSPredicate, _ s: [NSSortDescriptor]? = nil) -> [Property] {
        let fetchRequest: NSFetchRequest<Property> = Property.fetchRequest()
        fetchRequest.predicate = p
        fetchRequest.sortDescriptors = s
        return (try? self.fetch(fetchRequest)) ?? .init()
    }
    
    @discardableResult
    func fetchProperty(_ builder: PropertyBuilder) -> Property {
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
