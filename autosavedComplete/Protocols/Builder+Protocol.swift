//
//  Builder+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/6/23.
//

import Foundation

public typealias PropertyBuilder = any BuilderProtocol

public protocol BuilderProtocol: PropertyProtocol {
    
    static var primaryEnum: PrimaryEnum { get }
    static var random: Self { get }
    
    init(_ any: any PropertyProtocol)
    
    var identity: UUID { get }
    
}

extension BuilderProtocol {
        
    public var primaryEnum: PrimaryEnum { Self.primaryEnum }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.get(.primary))
        hasher.combine(self.get(.secondary))
        hasher.combine(self.get(.search))
    }
    
    public func doesEqual(_ other: PropertyBuilder) -> Bool {
        self.hashValue == other.hashValue
    }
    
    public func doesNotEqual(_ other: PropertyBuilder) -> Bool {
        self.hashValue != other.hashValue
    }
        
}
