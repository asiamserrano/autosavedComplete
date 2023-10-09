//
//  StringCollection+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public typealias StringCollection = [String: String]

extension StringCollection {
    
    public func insertString(_ str: String) -> Self {
        var new: Self = self
        new[str.canonicalized] = str.trimmed
        return new
    }
    
    public func removeString(_ index: Int) -> Self {
        var new: Self = self
        new[self.getKeys()[index]] = nil
        return new
    }
    
    public func getKeys() -> [Key] { self.keys.sorted() }

    public func getValues() -> [String] { self.values.sorted() }
    
    public func equals(_ other: Self) -> Bool {
        self.getKeys() == other.getKeys()
    }
        
    var isEmpty: Bool { self.getKeys().isEmpty }
    
}
