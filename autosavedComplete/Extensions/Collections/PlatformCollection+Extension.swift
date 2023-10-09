//
//  PlatformCollection+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public typealias PlatformCollection = [PlatformEnum: FormatCollection]

extension PlatformCollection {
    
    public static func initialize(_ arr: [PropertyEnum]) -> Self {
        let new: [(PlatformBuilder, FormatBuilder)] = arr.filter {
            $0.primaryEnum == nil
        }.map { (.init($0.mainBuilder), .init($0.subBuilder!)) }
        return .initialize(new)
    }
    
    public static func initialize(_ arr: [(PlatformBuilder, FormatBuilder)]) -> Self {
        var new: Self = .init()
        arr.forEach { new = new.insertPlatform($0.0.platformEnum, $0.1.formatEnum) }
        return new
    }
    
    public func insertPlatform(_ p: PlatformEnum, _ f: FormatEnum) -> Self {
        var new: Self = self
        new[p] = self.getValues(p).insert(f)
        return new
    }
    
    public func removeFormat(_ p: PlatformEnum, _ index: Int) -> Self {
        var new: Self = self
        new[p] = self.getValues(p).remove(index)
        return new
    }
    
    public func removePlatform(_ index: Int) -> Self {
        var new: Self = self
        new[self.getKeys()[index]] = nil
        return new
    }
    
    public func getEnums(_ p: Key) -> [PropertyEnum] {
        self.getValues(p).map { .platform(.init(p), .init($0)) }
    }
    
    public func getEnums() -> [PropertyEnum] {
        self.getKeys().flatMap(self.getEnums)
    }

    func getKeys() -> [Key] { self.keys.sorted() }
    
    func getValues(_ p: Key) -> Value { self[p] ?? .init() }
    
    func isEmpty(_ i: Key) -> Bool { self.getValues(i).isEmpty }
    
    var isEmpty: Bool { self.getKeys().isEmpty }
    
    var count: Int { self.getKeys().map { self.getValues($0).count }.reduce(0, +) }
    
}
