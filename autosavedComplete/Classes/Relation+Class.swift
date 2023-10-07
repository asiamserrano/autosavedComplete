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

    @NSManaged public var game_uuid: UUID?
    @NSManaged public var primary_property_uuid: UUID?
    @NSManaged public var secondary_property_uuid: UUID?

}

extension Relation : Identifiable {

}
