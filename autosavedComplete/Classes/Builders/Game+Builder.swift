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
    public private (set) var added: Date = .today
        
    public var title: String = .empty
    public var released: Date = .today
    public var status: Bool = true
    public var image: Data? = nil
    
    public var properties: PropertyCollection = .init()
    
    public init() { }
    
    public init(_ game: Game) { //}, _ col: PropertyCollection) {
        self.identity = game.identity
        self.added = game.added
        self.title = game.display
        self.released = game.released
        self.status = game.status
        self.image = game.image
//        self.properties = col
    }
    
    public func equals(_ other: GameBuilder) -> Bool {
        self.display == other.display
        && self.released.dashless == other.released.dashless
        && self.image == other.image
//        && self.properties == other.properties
    }
    
    public var search: String {
        self.display.canonicalized
    }
    
    public var display: String {
        self.title.trimmed
    }
    
}

extension GameBuilder {
    
    @discardableResult
    public func withIdentity(_ id: UUID?) -> Self {
        self.identity = .init(id)
        return self
    }
    
    @discardableResult
    public func withTitle(_ str: String?) -> Self {
        self.title = str?.trimmed ?? .empty
        return self
    }
    
    @discardableResult
    public func withRelease(_ dt: Date?) -> Self {
        self.released = .init(dt ?? .today)
        return self
    }
    
    @discardableResult
    public func withAddDate(_ dt: Date?) -> Self {
        self.added = .init(dt ?? .today)
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
    
//    @discardableResult
//    public func withProperties(_ p: PropertyCollection) -> Self {
//        self.properties = p
//        return self
//    }
//    
//    @discardableResult
//    public func withProperties(_ p: [PropertyEnum]) -> Self {
//        self.withProperties(.init(p))
//    }
    
}


