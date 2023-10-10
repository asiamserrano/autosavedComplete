//
//  Collection+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation
import SwiftUI
 
//public protocol CollectionProtocol: ObservableObject, Equatable {
//    
//    var inputs: InputCollection { get }
//    var modes: ModeCollection { get }
//    var platforms: PlatformCollection { get }
//    
//}
//
//extension CollectionProtocol {
//    
//    public var count: Int {
//        self.inputs.count +
//        self.modes.count +
//        self.platforms.count
//    }
//
//    public static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.inputs.equals(rhs.inputs) &&
//        lhs.modes.equals(rhs.modes) &&
//        lhs.platforms.equals(rhs.platforms)
//    }
//    
//    public var allEnums: [PropertyEnum] {
//        [ 
//            self.inputs.getEnums(),
//            self.modes.getEnums(),
//            self.platforms.getEnums()
//        ] .flatMap { $0 }
//    }
//    
//    public var allBuilders: [PropertyBuilder] { self.allEnums.convert() }
//    
//}
