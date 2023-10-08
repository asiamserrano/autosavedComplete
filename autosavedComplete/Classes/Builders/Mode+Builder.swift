//
//  Mode+Builder.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/6/23.
//

import Foundation

public struct ModeBuilder: BuilderProtocol {
    
    public static var primaryEnum: PrimaryEnum { .mode }
    
    public static var random: Self {
        .init(.random)
    }

    public private (set) var identity: UUID
    private var modeEnum: ModeEnum
    
    public init(_ m: ModeEnum) {
        self.identity = .init()
        self.modeEnum = m
    }
    
    public init(_ any: any PropertyProtocol) {
        self.identity = .init(any.get(.identity))
        self.modeEnum = .init(any.get(.secondary))!
    }
    
    public func get(_ v: Property.Variable) -> String? {
        switch v {
        case .identity: return self.identity.uuidString
        case .primary: return self.primaryEnum.key
        case .secondary: return self.modeEnum.key
        case .search: return self.modeEnum.search
        case .display: return self.modeEnum.display
        }
    }
    
}
