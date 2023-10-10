//
//  PlayStation+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation


public enum PlayStationEnum: PlatformProtocol {
    
    public static var familyEnum: FamilyEnum { .playstation }
    
    case ps1, ps2, ps3, ps4, ps5, psp
    
    public var display: String {
        
        var end: String {
            if let ch: Character = self.key.last, let i: Int = Int(String(ch)) {
                return i == 1 ? .empty : i.description
            } else { return "Portable" }
        }
        
        return "\(Self.familyEnum.display) \(end)".trimmed
    }
    
//    public var typeEnum: PlatformType {
//        self == .psp ? .handheld : .console
//    }
    
    public var digitalFormats: [DigitalEnum] {
        switch self {
        case .psp: return [.file]
        case .ps1, .ps2: return []
        default: return [.psn, .file]
        }
    }
    
}
