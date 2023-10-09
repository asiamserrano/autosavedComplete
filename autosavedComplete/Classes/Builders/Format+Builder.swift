//
//  Format+Builder.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/6/23.
//

import Foundation

public struct FormatBuilder: BuilderProtocol {
    
    public static var primaryEnum: PrimaryEnum { .format }
    
    public static var random: Self {
        .init(.random)
    }

    public private (set) var identity: UUID
    public private (set) var formatEnum: FormatEnum
    
    public init(_ f: FormatEnum) {
        self.identity = .init()
        self.formatEnum = f
    }
    
    public init(_ any: any PropertyProtocol) {
        self.identity = .init(any.get(.identity))
        self.formatEnum = .init(any.get(.secondary), any.get(.search))!
    }
    
    public func get(_ v: Property.Variable) -> String? {
        switch v {
        case .identity: return self.identity.uuidString
        case .primary: return self.formatEnum.get(.primary)
        case .secondary: return self.formatEnum.get(.secondary)
        case .search: return self.formatEnum.get(.search)
        case .display: return self.formatEnum.get(.display)
        }
    }
    
}
