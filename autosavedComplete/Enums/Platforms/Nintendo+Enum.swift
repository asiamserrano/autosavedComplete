//
//  Nintendo+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum NintendoEnum: PlatformProtocol {
    
    public static var familyEnum: FamilyEnum { .nintendo }
    
    case snes, `switch`, wii, wiiu, gamecube, n3ds
    
    public var display: String {
        let name: String = Self.familyEnum.display
        switch self {
        case .snes: return "Super \(name) Entertainment System"
        case .switch: return "\(name) Switch"
        case .wii: return "Wii"
        case .wiiu : return "Wii U"
        case .gamecube: return "GameCube"
        case .n3ds: return "\(name) 3DS"
        }
    }
//
//    public var typeEnum: PlatformType {
//        switch self {
//        case .n3ds: return .handheld
//        case .switch, .wiiu: return .hybrid
//        default: return .console
//        }
//    }
    
    public var physicalFormat: PhysicalEnum {
        switch self {
        case .snes: return .cartridge
        case .switch, .n3ds: return .card
        default: return .disc
        }
    }

    public var digitalFormats: [DigitalEnum] {
        switch self {
        case .n3ds, .gamecube, .snes: return []
        default: return [.nintendo, .file]
        }
    }
    
}
