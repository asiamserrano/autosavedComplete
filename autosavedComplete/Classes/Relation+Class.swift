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

    public func update(_ g: UUID, _ p: UUID, _ s: UUID? = nil) -> Relation {
        self.game_uuid = g
        self.primary_property_uuid = p
        self.secondary_property_uuid = s
        return self
    }
    
}
