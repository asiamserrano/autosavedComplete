//
//  ModeCollection+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public typealias ModeCollection = [ModeEnum]

extension ModeCollection {
    
    public static func initialize(_ arr: [PropertyEnum]) -> Self {
        let new: [ModeBuilder] = arr.filter {
            $0.primaryEnum == .mode
        }.map { .init($0.mainBuilder) }
        return .initialize(new)
    }
    
    public static func initialize(_ arr: [ModeBuilder]) -> Self {
        var new: Self = .init()
        arr.forEach { new = new.insert($0.modeEnum) }
        return new
    }
    
    public func getEnums() -> [PropertyEnum] {
        self.map { .mode(.init($0)) }
    }
    
}
