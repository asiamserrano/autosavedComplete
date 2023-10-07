//
//  Game+Builder.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/7/23.
//

import Foundation
import CoreData

public class GameBuilder {
    
    public private (set) var identity: UUID = .init()
    public private (set) var add: Date = .today
        
    public var display: String = .empty
    public var release: Date = .today
    public var status: Bool = true
    public var image: Data? = nil
    
    public init() { }
    
    public init(_ game: Game) {
        self.identity = .init(game.identity_uuid)
        self.add = game.add_date ?? .today
        self.display = game.display_string ?? .empty
        self.release = game.release_date ?? .today
        self.status = game.status_boolean
        self.image = game.image_data
    }
    
}

extension GameBuilder {
    
//    @discardableResult
//    public func build(_ con: Context) -> Game {
//        .init(context: con).update(con, self)
//    }
    
}

extension GameBuilder {
    
    @discardableResult
    public func withIdentity(_ id: UUID?) -> Self {
        self.identity = .init(id)
        return self
    }
    
    @discardableResult
    public func withDisplay(_ str: String?) -> Self {
        self.display = str?.trimmed ?? .empty
        return self
    }
    
    @discardableResult
    public func withRelease(_ dt: Date?) -> Self {
        self.release = .init(dt ?? .today)
        return self
    }
    
    @discardableResult
    public func withAddDate(_ dt: Date?) -> Self {
        self.add = .init(dt ?? .today)
        return self
    }
    
    @discardableResult
    public func withStatus(_ b: Bool) -> Self {
        self.status = b
        return self
    }
    
    @discardableResult
    public func withImage(_ i: Data?) -> Self {
        self.image = i
        return self
    }
    
}


