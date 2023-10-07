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

    @NSManaged public private (set) var identity_uuid: UUID?
    @NSManaged public private (set) var search_string: String?
    @NSManaged public private (set) var display_string: String?
    @NSManaged public private (set) var release_date: Date?
    @NSManaged public private (set) var add_date: Date?
    @NSManaged public private (set) var status_boolean: Bool
    @NSManaged public private (set) var image_data: Data?

}

extension Game : Identifiable {

    public enum Variable: String {
        case identity = "identity_uuid"
        case search = "search_string"
        case display = "display_string"
        case release = "release_date"
        case add = "add_date"
        case status = "image_data"
    }
    
    public func update(_ con: Context, _ builder: GameBuilder) -> Game {
        self.identity_uuid = builder.identity
        self.search_string = builder.display.canonicalized
        self.display_string = builder.display.trimmed
        self.release_date = builder.release
        self.add_date = builder.add
        self.status_boolean = builder.status
        self.image_data = builder.image
        con.store()
        return self
    }
    
}
