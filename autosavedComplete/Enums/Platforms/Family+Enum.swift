//
//  Family+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum FamilyEnum: IterableProtocol {
    case nintendo, pc, playstation, xbox

    public var display: String {
        switch self {
        case .nintendo: return "Nintendo"
        case .pc: return "Operating System"
        case .playstation: return "PlayStation"
        case .xbox: return "Xbox"
        }
    }
    
//    public var allPlatforms: [PlatformEnum] {
//        switch self {
//        case .nintendo: return NintendoEnum.allPlatforms
//        case .pc: return PCEnum.allPlatforms
//        case .playstation: return PlayStationEnum.allPlatforms
//        case .xbox: return XboxEnum.allPlatforms
//        }
//    }

}
