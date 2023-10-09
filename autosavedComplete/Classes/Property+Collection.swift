//
//  Property+Collection.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public class PropertyCollection: CollectionProtocol {
    
    @Published public var inputs: InputCollection = [:]
    @Published public var modes: ModeCollection = []
    @Published public var platforms: PlatformCollection = [:]
    
    public init() { }
    
    public init(_ props: [PropertyEnum]) {
        self.inputs = .initialize(props)
        self.modes = .initialize(props)
        self.platforms = .initialize(props)
    }
    
}

extension PropertyCollection {
    
//    public var allEnums: [PropertyEnum] {
//        let i: [PropertyEnum] = self.inputs.getKeys().flatMap { inputEn in
//            self.getInput(inputEn).getValues().map { .input(.init(inputEn, $0)) }
//        }
//        let m: [PropertyEnum] = self.getModes().map { .mode(.init($0)) }
//        let p: [PropertyEnum] = self.platforms.getKeys().flatMap { platformEn in
//            self.getPlatform(platformEn).map { .platform(.init(platformEn), .init($0)) }
//        }
//        
//        return [i, m, p].flatMap { $0 }
//    }
    
//    public var allBuilders: [PropertyBuilder] {
//        let i: [PropertyBuilder] = self.inputs.getKeys().flatMap { inputEn in
//            self.getInput(inputEn).getValues().map { .forInputBuilder(.init(inputEn, $0)) }
//        }
//        let m: [PropertyBuilder] = self.getModes().map { .forModeBuilder(.init($0)) }
//        let p: [PropertyBuilder] = self.platforms.getKeys().flatMap { platformEn in
//            self.getPlatform(platformEn).flatMap { [
//                .forPlatformBuilder(.init(platformEn), .init($0)),
//                .forFormatBuilder(.init(platformEn), .init($0)),
//            ] }
//        }
//        
//        return [i, m, p].flatMap { $0 }
//    }
    
//    public var all: [PropertyBuilder] {
//        let i: [PropertyBuilder] = self.inputs.getKeys().flatMap { inputEn in
//            self.getInput(inputEn).getValues().map { .forInputBuilder(.init(inputEn, $0)) }
//        }
//        let m: [PropertyBuilder] = self.getModes().map { .forModeBuilder(.init($0)) }
//        let p: [PropertyBuilder] = self.platforms.getKeys().flatMap { platformEn in
//            self.getPlatform(platformEn).flatMap { [
//                .forPlatformBuilder(.init(platformEn), .init($0)),
//                .forFormatBuilder(.init(platformEn), .init($0)),
//            ] }
//        }
//        
//        return [i, m, p].flatMap { $0 }
//    }
    
//    public var all: [(UUID, String, String)] {
//        let i: [(String, String)] = self.inputs.getKeys().flatMap { inputEn in
//            self.getInput(inputEn).getValues().map { (inputEn.display, $0) }
//        }
//        let m: [(String, String)] = self.getModes().map { (PrimaryEnum.mode.display, $0.display) }
//        let p: [(String, String)] = self.platforms.getKeys().flatMap { platformEn in
//            self.getPlatform(platformEn).map { (platformEn.get(.display)!, $0.get(.display)!) }
//        }
//        
//        return [i, m, p].flatMap { $0 }.map { (UUID(), $0.0, $0.1) }
//    }
    
    
//    public func get(_ p: PlatformEnum) -> FormatCollection {
//        (self.platforms[p] ?? .init()).sorted()
//    }
//    
//    public func insert(_ i: InputEnum, _ str: String) -> Void {
//        let value: String = str.trimmed
//        switch i {
//        case .series: self.series = value
//        case .developer: self.developers = self.developers.insert(value)
//        case .publisher: self.publishers = self.publishers.insert(value)
//        case .genre: self.genres = self.genres.insert(value)
//        }
//    }
//    
//    public func insert(_ m: ModeEnum) -> Void {
//        self.modes = self.modes.insert(element: m)
//    }
//
//    public func removeInput(_ key: InputEnum, _ index: Int) {
//        self.remove(InputBuilder(key, self.getValues(key)[index]))
//    }
    
//    public func remove(_ i: InputEnum, _ str: String) -> Void {
//        switch i {
//        case .series: self.series = str.equals(self.series) ? nil : self.series
//        case .developer: self.developers = self.developers.remove(str)
//        case .publisher: self.publishers = self.publishers.remove(str)
//        case .genre: self.genres = self.genres.remove(str)
//        }
//    }
//    
//    public func remove(_ m: ModeEnum) -> Void {
//        self.modes = self.modes.remove(element: m)
//    }
//    

    
}
