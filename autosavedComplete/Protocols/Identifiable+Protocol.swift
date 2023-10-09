//
//  Identifiable+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

// MARK: - Collection Definition

extension Array where Element: IdentifiableProtocol {
    
    public func contains(element: Element) -> Bool {
        self.contains(where: element.equals)
    }
    
    public func insert(_ element: Element) -> Self {
        var new: Self = self
        if !self.contains(element: element) { new.append(element) }
        return new
    }
    
    public func remove(element: Element) -> Self {
        self.filter(element.notEqual)
    }
        
}

// MARK: - Protocol Definition

public protocol IdentifiableProtocol: Identifiable, Equatable, Hashable {
    
    var id: Int { get }
    
    func equals(_ other: Self) -> Bool
    func notEqual(_ other: Self) -> Bool
}

public extension IdentifiableProtocol {
    
    static func == (lhs: Self, rhs: Self) -> Bool { lhs.id == rhs.id }
    
    var id: Int { self.hashValue }
    
    var className: String { String(describing: Self.self) }
    
    func equals(_ other: Self) -> Bool { self == other }
    
    func notEqual(_ other: Self) -> Bool { !self.equals(other) }
    
}
