//
//  FormatCollection+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public typealias FormatCollection = [FormatEnum]

extension FormatCollection {
    
    public func insertFormat(_ f: FormatEnum) -> Self {
        var new: Self = self
        if !self.contains(element: f) { new.append(f) }
        return new
    }
    
    public func removeFormat(_ index: Int) -> Self {
        var new: Self = self.sorted()
        new.remove(at: index)
        return new
    }
    
    public func transform(_ p: PlatformEnum) -> [PropertyEnum] {
        self.map { .platform(.init(p), .init($0)) }
    }
//    public func transform(_ p: PlatformEnum) -> [PropertyEnum] {
//        self.toArray.transform(p)
//    }
//    
//    private var toArray: [Element] { self.map {$0} }
}
