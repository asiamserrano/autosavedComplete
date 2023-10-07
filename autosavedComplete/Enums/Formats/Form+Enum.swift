//
//  Form+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum FormEnum: IterableProtocol {
    
    case digital, physical
            
    public var icon: String {
        switch self {
        case .digital: return "arrow.down.circle.fill"
        case .physical: return "opticaldisc.fill"
        }
    }
    
}
