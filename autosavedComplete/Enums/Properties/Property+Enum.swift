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

    public func convert() -> [PropertyBuilder] {
        self.flatMap { ele in
            if let sub: PropertyBuilder = ele.subBuilder {
                return [ele.mainBuilder, sub]
            } else { return [ele.mainBuilder] }
        }
    }
    
}

// MARK: - Class Definition

public enum PropertyEnum: PropertiesProtocol {
    
    public static func input(_ i: InputEnum, _ s: String) -> Self {
        .input(InputBuilder(i, s))
    }
    
    public static func mode(_ m: ModeEnum) -> Self {
        .mode(ModeBuilder(m))
    }
    
    public static func platform(_ p: PlatformEnum, _ f: FormatEnum) -> Self {
        .platform(PlatformBuilder(p), FormatBuilder(f))
    }
    
    case input(InputBuilder)
    case mode(ModeBuilder)
    case platform(PlatformBuilder, FormatBuilder)
    
    private var builders: (PropertyBuilder, PropertyBuilder?) {
        switch self {
        case .input(let i): return (.forInputBuilder(i), nil)
        case .mode(let m): return (.forModeBuilder(m), nil)
        case .platform(let p, let f): return (.forPlatformBuilder(p, f), .forFormatBuilder(p, f))
        }
    }
    
    public var propertiesEnum: PropertiesEnum {
        switch self {
        case .input(_): return .input
        case .mode(_): return .mode
        case .platform(_, _): return .platform
        }
    }
    
    public var mainBuilder: PropertyBuilder {
        self.builders.0
    }
    
    public var subBuilder: PropertyBuilder? {
        self.builders.1
    }

}
