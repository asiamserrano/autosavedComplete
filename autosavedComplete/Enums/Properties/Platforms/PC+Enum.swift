//
//  PC+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation


public enum PCEnum: PlatformProtocol {
    
    public static var familyEnum: FamilyEnum { .pc }
    
    case win, mac
    
    public var display: String {
        switch self {
        case .win: return "Microsoft Windows"
        case .mac: return "Apple macOS"
        }
    }
    
//    public var typeEnum: PlatformType { .os }
    
    public var digitalFormats: [DigitalEnum] {
        [.steam, .origin, .file]
    }
    
}
