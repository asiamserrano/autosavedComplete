//
//  PlatformCollection+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public typealias PlatformCollection = [PlatformEnum: FormatCollection]

extension PlatformCollection {
    
    public func insertPlatform(_ p: PlatformEnum, _ f: FormatEnum) -> Self {
        var new: Self = self
        new[p] = self.getValues(p).insertFormat(f)
        return new
    }
    
    public func removeFormat(_ p: PlatformEnum, _ index: Int) -> Self {
        var new: Self = self
        new[p] = self.getValues(p).removeFormat(index)
        return new
    }
    
    public func removePlatform(_ index: Int) -> Self {
        var new: Self = self
        var keys: [Key] = self.getKeys().sorted()
        new[keys.remove(at: index)] = nil
        return new
    }
    
//    public func getEnums(_ p: Key) -> [PropertyEnum] {
//        self.getValues(p).map { .platform(.init(p), .init($0)) }
//    }
//    
//    public func getEnums() -> [PropertyEnum] {
//        self.getKeys().flatMap(self.getEnums)
//    }

    func getKeys() -> [Key] { self.keys.sorted() }
    
    func getValues(_ p: Key) -> Value { self[p] ?? .init() }
    
    func isEmpty(_ i: Key) -> Bool { self.getValues(i).isEmpty }
    
//    func equals(_ other: Self) -> Bool {
//        if self.getKeys() == other.getKeys() {
//            for platform in PlatformEnum.all {
//                let a: Value = self.getValues(platform)
//                let b: Value = other.getValues(platform)
//                if !a.equals(b) { return false }
//            }
//            return true
//        } else { return false }
//    }
    
    var isEmpty: Bool { self.getKeys().isEmpty }
    
//    var count: Int { self.getKeys().map { self.getValues($0).count }.reduce(0, +) }
    
}
