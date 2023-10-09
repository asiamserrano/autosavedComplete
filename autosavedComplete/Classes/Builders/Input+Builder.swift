//
//  Input+Builder.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/6/23.
//

import Foundation

public struct InputBuilder: BuilderProtocol {
    
    public static var primaryEnum: PrimaryEnum { .input }
    
    public static var random: Self {
        let input: InputEnum = .random
        let string: String = .random
        return .init(input, "\(input.display) \(string)")
    }

    public private (set) var identity: UUID
    
    public private (set) var inputEnum: InputEnum
    public private (set) var display: String
    
    public init(_ i: InputEnum, _ s: String) {
        self.identity = .init()
        self.inputEnum = i
        self.display = s.trimmed
    }
    
    public init(_ any: any PropertyProtocol) {
        self.identity = .init(any.get(.identity))
        self.inputEnum = .init(any.get(.secondary))!
        self.display = any.get(.display)!
    }
    
    public func get(_ v: Property.Variable) -> String? {
        switch v {
        case .identity: return self.identity.uuidString
        case .primary: return self.primaryEnum.key
        case .secondary: return self.inputEnum.key
        case .search: return self.display.canonicalized
        case .display: return self.display.trimmed
        }
    }
    
}
