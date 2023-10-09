//
//  Property+Builder.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public struct PropertyBuilder: PropertyProtocol {
    
    public static func forInputBuilder(_ input: InputBuilder) -> Self {
        .init(.input, input, nil)
    }
    
    public static func forModeBuilder(_ mode: ModeBuilder) -> Self {
        .init(.mode, mode, nil)
    }
    
    public static func forPlatformBuilder(_ platform: PlatformBuilder, _ format: FormatBuilder) -> Self {
        .init(.platform, platform, format)
    }
    
    public static func forFormatBuilder(_ platform: PlatformBuilder, _ format: FormatBuilder) -> Self {
        .init(.format, platform, format)
    }
    
    public var primaryEnum: PrimaryEnum
    
    private var first: anyBuilder
    private var second: anyBuilder?
    
    private init(_ p: PrimaryEnum, _ f: anyBuilder, _ s: anyBuilder?) {
        self.primaryEnum = p
        self.first = f
        self.second = s
    }
    
    public var main: anyBuilder {
        self.primaryEnum == .format ? self.second! : self.first
    }
    
    public var identity: UUID {
        self.main.identity
    }
    
    public func get(_ v: Property.Variable) -> String? {
        self.main.get(v)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.primaryEnum)
        hasher.combine(self.main)
    }
    
}
