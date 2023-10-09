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
    
    public static var DisplayKeyPath: KeyPath<Property, String?> {
        \Self.display_string
    }
    
    public var primaryEnum: PrimaryEnum {
        .init(self.primary_enum)!
    }
    
    public var identity: UUID {
        .init(self.identity_uuid)
    }
    
}

extension Property {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Property> {
        return NSFetchRequest<Property>(entityName: "Property")
    }

    @NSManaged private var identity_uuid: UUID?
    @NSManaged private var primary_enum: String?
    @NSManaged private var secondary_enum: String?
    @NSManaged private var search_string: String?
    @NSManaged private var display_string: String?

}

extension Property : PropertyProtocol {
    
    public enum Variable: String {
        case identity = "identity_uuid"
        case primary = "primary_enum"
        case secondary = "secondary_enum"
        case search = "search_string"
        case display = "display_string"
    }
    
    public func get(_ v: Variable) -> String? {
        switch v {
        case .identity: return self.identity.uuidString
        case .primary: return self.primary_enum
        case .secondary: return self.secondary_enum
        case .search: return self.search_string
        case .display: return self.display_string
        }
    }
    
    public func set(_ builder: PropertyBuilder) -> Property {
        self.identity_uuid = builder.identity
        self.primary_enum = builder.get(.primary)
        self.secondary_enum = builder.get(.secondary)
        self.search_string = builder.get(.search)
        self.display_string = builder.get(.display)
        return self
    }
    
}
