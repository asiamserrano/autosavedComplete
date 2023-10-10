//
//  Input+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum InputEnum: IterableProtocol {
    
    case series, developer, publisher, genre
    
    public var keyEnum: KeyEnum {
        switch self {
        case .series: return .series
        case .developer: return .developer
        case .publisher: return.publisher
        case .genre: return .genre
        }
    }
    
}
