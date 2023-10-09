//
//  Property+Enum.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/7/23.
//

import Foundation
import SwiftUI

// MARK: - Collection Definition

extension Array where Element == PropertyEnum {
    
//    public func filtered(_ p: PrimaryEnum) -> Self {
//        switch p {
//        case .input, .mode: return self.filter { $0.primaryEnum == .input }
//        case .mode: return
//        }
//    }
    
//    public func convert() -> [PropertyBuilder] {
//        self.flatMap { ele in
//            if let sub: PropertyBuilder = ele.subBuilder {
//                return [ele.mainBuilder, sub]
//            } else { return [ele.mainBuilder] }
//        }
//    }
//    
//    public func getInputs(_ i: InputEnum) -> [String] {
//        self.filter { $0.primaryEnum == .input }
//            .map { InputBuilder($0.mainBuilder) }
//            .filter { $0.inputEnum == i }
//            .map { $0.display }
//    }
//    
//    public func getModes() -> [ModeEnum] {
//        self.filter { $0.primaryEnum == .mode }
//            .map { ModeBuilder($0.mainBuilder).modeEnum }
//    }
//    
//    public func getPlatforms() -> PlatformCollection {
//        var dictionary: PlatformCollection = .init()
//        self.filter { $0.primaryEnum == nil }.forEach { item in
//            let platform: PlatformEnum = PlatformBuilder(item.mainBuilder).platformEnum
//            let format: FormatEnum = FormatBuilder(item.subBuilder!).formatEnum
//            dictionary[platform] = (dictionary[platform] ?? .init()).insert(element: format)
//        }
//        return dictionary
//    }
    
}

// MARK: - Class Definition

public typealias PropertyTuple = (PropertyBuilder, PropertyBuilder?)

public enum PropertyEnum: IdentifiableProtocol {
    
    case input(InputBuilder)
    case mode(ModeBuilder)
    case platform(PlatformBuilder, FormatBuilder)
    
    private var builders: PropertyTuple {
        switch self {
        case .input(let i): return (.forInputBuilder(i), nil)
        case .mode(let m): return (.forModeBuilder(m), nil)
        case .platform(let p, let f): return (.forPlatformBuilder(p, f), .forFormatBuilder(p, f))
        }
    }
    
    public var primaryEnum: PrimaryEnum? {
        switch self {
        case .input(_): return .input
        case .mode(_): return .mode
        case .platform(_, _): return nil
        }
    }
    
    public var mainBuilder: PropertyBuilder {
        self.builders.0
    }
    
    public var subBuilder: PropertyBuilder? {
        self.builders.1
    }

}
