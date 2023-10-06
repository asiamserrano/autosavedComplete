//
//  String+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public extension String {
    
    static var empty: Self { .init() }
    
    static var random: Self {
        let uuid: Self = UUID().uuidString
        let strs: [Substring] = uuid.split(separator: "-")
        return strs.randomElement()!.description
    }

    var trimmed: Self {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var canonicalized: Self {
        self.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .joined()
            .lowercased()
    }
    
    var isEmpty: Bool {
        self.canonicalized.count == 0
    }
    
    func equals(_ other: Self) -> Bool {
        self.canonicalized == other.canonicalized
    }

}

public extension String? {
    
    var toString: String {
        self ?? .empty
    }
    
    func equals(_ it: any IterableProtocol) -> Bool {
        self == it.key || self == it.search
    }
    
}

