//
//  Builder+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/6/23.
//

import Foundation

//public typealias PropertyBuilder = any BuilderProtocol

public typealias anyBuilder = any BuilderProtocol

public protocol BuilderProtocol: PropertyProtocol {
    
    static var primaryEnum: PrimaryEnum { get }
    static var random: Self { get }
    
    init(_ any: any PropertyProtocol)
    
    var identity: UUID { get }
    
}

extension BuilderProtocol {
    
//    public init?(_ en: PropertyEnum) {
//        self.init(self.primaryEnum, en)
//    }
//    
//    public init?(_ p: PrimaryEnum, _ en: PropertyEnum) {
//        let builder: PropertyBuilder? = p == .format ? en.builders.1 : en.builders.0
//        if let myself: Self = builder as? Self {
//            self.init(myself)
//        } else { return nil }
//    }
        
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
