//
//  Xbox+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum XboxEnum: PlatformProtocol {
    
    public static var familyEnum: FamilyEnum { .xbox }
    
    case xbox, x360, one
    
    public var display: String {
        var end: String {
            switch self {
            case .xbox: return .empty
            case .x360: return "360"
            case .one: return "One"
            }
        }
        
        return "\(Self.familyEnum.display) \(end)".trimmed
    }
    
//    public var typeEnum: PlatformType { .console }
    
    public var digitalFormats: [DigitalEnum] {
        self == .xbox ? [] : [.xbox, .file]
    }
    
}
