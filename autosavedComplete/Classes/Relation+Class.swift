//
//  Relation+Class.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//
//

import Foundation
import CoreData

@objc(Relation)
public final class Relation: NSManagedObject {
    
}

extension Relation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Relation> {
        return NSFetchRequest<Relation>(entityName: "Relation")
    }

    @NSManaged private var game_uuid: UUID?
    @NSManaged private var primary_property_uuid: UUID?
    @NSManaged private var secondary_property_uuid: UUID?

}

extension Relation : Identifiable {
    
    public enum Variable: String {
        case game = "game_uuid"
        case primary = "primary_property_uuid"
        case secondary = "secondary_property_uuid"
    }

    public func update(_ g: UUID, _ p: UUID, _ s: UUID? = nil) -> Relation {
        self.game_uuid = g
        self.primary_property_uuid = p
        self.secondary_property_uuid = s
        return self
    }
    
    public func get(_ v: Variable) -> UUID? {
        switch v {
        case .game: return self.game_uuid
        case .primary: return self.primary_property_uuid
        case .secondary: return self.secondary_property_uuid
        }
    }
    
    public var predicateForProperties: [NSPredicate] {
        [ self.get(.primary), self.get(.secondary) ]
            .filter { $0 != nil }.map { .init(.identity, $0!, .equal) }
    }
    
//    public var properties: (UUID?, UUID?) {
//        (self.get(.primary), self.get(.secondary))
//    }
    
//    public var properties: [UUID] {
//        let primary: UUID = self.get(.primary)!
//        if let secondary: UUID = self.get(.secondary) {
//            return [primary, secondary]
//        } else { return [primary] }
//    }
    
}
