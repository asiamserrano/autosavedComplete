//
//  Platform+Builder.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/6/23.
//

import Foundation

public struct PlatformBuilder: BuilderProtocol {
    
    public static var primaryEnum: PrimaryEnum { .platform }
    
    public static var random: Self {
        .init(.random)
    }

    public private (set) var identity: UUID
    public private (set) var platformEnum: PlatformEnum
    
    public init(_ p: PlatformEnum) {
        self.identity = .init()
        self.platformEnum = p
    }
    
    public init(_ any: any PropertyProtocol) {
        self.identity = .init(any.get(.identity))
        self.platformEnum = .init(any.get(.secondary), any.get(.search))!
    }
    
    public func get(_ v: Property.Variable) -> String? {
        switch v {
        case .identity: return self.identity.uuidString
        case .primary: return self.platformEnum.get(.primary)
        case .secondary: return self.platformEnum.get(.secondary)
        case .search: return self.platformEnum.get(.search)
        case .display: return self.platformEnum.get(.display)
        }
    }
    
}
