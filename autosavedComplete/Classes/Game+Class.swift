//
//  Game+Class.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//
//

import Foundation
import CoreData

@objc(Game)
public final class Game: NSManagedObject {

}


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var identity_uuid: UUID?
    @NSManaged public var search_string: String?
    @NSManaged public var display_string: String?
    @NSManaged public var release_date: Date?
    @NSManaged public var add_date: Date?
    @NSManaged public var status_boolean: Bool
    @NSManaged public var image_data: Data?

}

extension Game : Identifiable {

}
