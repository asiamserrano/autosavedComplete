//
//  Mode+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum ModeEnum: IterableProtocol {
    
    case single, two, multi
    
    public var display: String {
         switch self {
         case .single: return "Single-Player"
         case .two: return "Two-Player"
         case .multi: return "Multiplayer"
         }
     }
    
}
