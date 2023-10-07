//
//  Digital+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum DigitalEnum: FormatProtocol {
    
    public static var formEnum: FormEnum  { .digital }
    
    case steam, origin, psn, xbox, nintendo, file
    
    public var display: String {
        switch self {
        case .psn: return "Playstation Network"
        case .xbox: return "Xbox Live"
        case .nintendo: return "Nintendo eShop"
        case .file: return "System File"
        case .origin: return "Origin"
        case .steam: return "Steam"
        }
    }
    
}
