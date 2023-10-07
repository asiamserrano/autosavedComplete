//
//  Property+Class.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//
//

import Foundation
import CoreData

@objc(Property)
public final class Property: NSManagedObject {

}

extension Property {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Property> {
        return NSFetchRequest<Property>(entityName: "Property")
    }

    @NSManaged public var identity_uuid: UUID?
    @NSManaged public var primary_enum: String?
    @NSManaged public var secondary_enum: String?
    @NSManaged public var search_string: String?
    @NSManaged public var display_string: String?

}

extension Property : Identifiable {

}
