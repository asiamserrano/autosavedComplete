//
//  Identifiable+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public protocol IdentifiableProtocol: Identifiable, Equatable, Hashable {
    
    var id: Int { get }
    
}

public extension IdentifiableProtocol {
    
    static func == (lhs: Self, rhs: Self) -> Bool { lhs.id == rhs.id }
    
    var id: Int { self.hashValue }
    
    var className: String { String(describing: Self.self) }
    
}
