//
//  Key+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/9/23.
//

import Foundation

public enum KeyEnum: IterableProtocol {
    case series, genre, mode, publisher, developer, platform
    
    public var valueEnum: ValueEnum {
        switch self {
        case .series: return .string(nil)
        case .platform: return .platforms(.init())
        case .mode: return .modes(.init())
        default: return .strings(.init())
        }
    }
    
}


