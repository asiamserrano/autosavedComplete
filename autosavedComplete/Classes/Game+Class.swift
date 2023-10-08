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
    
    public var identity: UUID {
        let uuid: UUID = .init(self.identity_uuid)
        self.identity_uuid = uuid
        return uuid
    }
    
    public var alertString: String {
        "\(self.display) (\(self.released.year))"
    }
    
    public var search: String { self.search_string ?? .empty }
    public var display: String { self.display_string ?? .empty }
    public var released: Date { self.release_date ?? .today }
    public var added: Date { self.add_date ?? .today }
    public var status: Bool { self.status_boolean }
    public var image: Data? { self.image_data }
    
}

extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged private var identity_uuid: UUID?
    @NSManaged private var search_string: String?
    @NSManaged private var display_string: String?
    @NSManaged private var release_date: Date?
    @NSManaged private var add_date: Date?
    @NSManaged private var status_boolean: Bool
    @NSManaged private var image_data: Data?

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
        self.search_string = builder.search
        self.display_string = builder.display
        self.release_date = builder.released
        self.add_date = builder.added
        self.status_boolean = builder.status
        self.image_data = builder.image
        con.store()
        return self
    }
    
}
