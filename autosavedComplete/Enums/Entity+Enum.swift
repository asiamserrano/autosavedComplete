//
//  Entity+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/7/23.
//

import Foundation

public enum EntityEnum: IterableProtocol {
    
    case game, property, relation
    
    
    public var display: String {
        switch self {
        case .property: return "Properties"
        default: return "\(self.key.capitalized)s"
        }
    }
}
