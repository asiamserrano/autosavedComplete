//
//  Property+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public protocol PropertiesProtocol: IdentifiableProtocol {
    
    var propertiesEnum: PropertiesEnum { get }
            
}

public protocol PropertyProtocol: PropertiesProtocol {
    
    var primaryEnum: PrimaryEnum { get }
    
    func get(_ v: Property.Variable) -> String?
        
}

public extension PropertyProtocol {
    
    var propertiesEnum: PropertiesEnum {
        switch self.primaryEnum {
        case .input: return .input
        case .mode: return .mode
        default: return .platform
        }
    }
    
}



//public protocol PropertyProtocol: IdentifiableProtocol {
//
////    var primaryEnum: PrimaryEnum { get }
//
//    var primary: String { get }
//    var secondary: String { get }
//    var search: String { get }
//    var display: String { get }
//
//}
