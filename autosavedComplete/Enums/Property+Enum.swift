//
//  Property+Enum.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/7/23.
//

import Foundation

public enum PropertyEnum: IdentifiableProtocol {
    
    case input(InputBuilder)
    case mode(ModeBuilder)
    case platform(PlatformBuilder, FormatBuilder)
    
    public var builders: [PropertyBuilder] {
        switch self {
        case .input(let i): return [i]
        case .mode(let m): return [m]
        case .platform(let p, let f): return [p, f]
        }
    }
    
}
