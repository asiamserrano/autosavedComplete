//
//  Iterable+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

//extension Collection where Element: IterableProtocol {
//    
//    public func getValues() -> [Element] { self.sorted() }
//    
//    public func remove(_ index: Int) -> Self {
//        self.filter { $0 != self.getValues()[index] }
//    }
//    
//    public func equals(_ other: Self) -> Bool {
//        self.getValues() == other.getValues()
//    }
//    
//}

public protocol IterableProtocol: IdentifiableProtocol, CaseIterable, Comparable {

    var key: String { get } // always will be saved as either primary or secondary enum for property
    var search: String { get } // *if secondary, will be saved as search_string for property
    var display: String { get } // *if secondary, will be saved as display_string for property

    static var all: [Self] { get }

}

public extension IterableProtocol {

    static func < (lhs:Self, rhs: Self) -> Bool { lhs.index < rhs.index }

    static var all: [Self] { self.allCases.sorted() }
    
    static var random: Self { self.all.randomElement()! }

    init?(_ str: String?) {
        if let found: Self = Self.all.first(where: str.equals) {
            self = found
        } else { return nil }
    }
    
    private var index: Int { Int(String(describing: Self.allCases.firstIndex(of: self)!))! }
    
    var key: String { String(describing: self) }
    var search: String { self.display.canonicalized }
    var display: String { self.key.capitalized }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.className)
        hasher.combine(self.key)
    }
    
    func next() -> Self {
        let index: Int = Self.all.count - 1 == self.index ? 0 : self.index + 1
        return Self.all[index]
    }

}
