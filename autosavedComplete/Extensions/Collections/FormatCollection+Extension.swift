//
//  FormatCollection+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public typealias FormatCollection = [FormatEnum]

extension FormatCollection {
    
//    public func insertFormat(_ f: FormatEnum) -> Self {
//        var new: Self = self
//        if !self.contains(value: f) { new.append(f) }
//        return new
//    }
//    
//    public func removeFormat(_ index: Int) -> Self {
//        self.filter { $0 != self.getValues()[index] }
//    }
//    
//    public func getValues() -> Self { self.sorted() }
//    
    public func transform(_ p: PlatformEnum) -> [PropertyEnum] {
        self.map { .platform(.init(p), .init($0)) }
    }
    
}
