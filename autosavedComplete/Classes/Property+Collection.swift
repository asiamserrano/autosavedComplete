//
//  Property+Collection.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public typealias PropertyDictionary = [KeyEnum: ValueEnum]

public class PropertyCollection: ObservableObject {
   
    @Published var dictionary: PropertyDictionary = .init()
    
    public init() { }
    
    public convenience init(_ props: [PropertyEnum]) {
        self.init()
        props.forEach { self.insert($0) }
    }
    
    public func get(_ key: KeyEnum) -> ValueEnum {
        self.dictionary[key] ?? key.valueEnum
    }
    
    public func put(_ key: KeyEnum, _ value: ValueEnum) -> Void {
        self.dictionary[key] = value
    }
    
    public func insert(_ propertyEnum: PropertyEnum) -> Void {
        switch propertyEnum {
        case .input(let i): do {
            let input: InputEnum = i.inputEnum
            let display: String = i.display
            let key: KeyEnum = i.inputEnum.keyEnum
            self.put(key, self.get(key).insert(input, display))
        }
        case .mode(let m): do {
            self.put(.mode, self.get(.mode).insert(m.modeEnum))
        }
        case .platform(let p, let f):
            self.put(.platform, self.get(.platform).insert(p.platformEnum, f.formatEnum))
        }
    }
    
    public func getInputs(_ i: InputEnum) -> [String] {
        switch self.get(i.keyEnum) {
        case .string(let s): do {
            if let string: String = s { return [string] }
            else { return [] }
        }
        case .strings(let s): return s.getValues()
        default: return []
        }
    }
    
    public func getModes() -> [ModeEnum] {
        switch self.get(.mode) {
        case .modes(let col): return col.sorted()
        default: return []
        }
    }
    
    public func getPlatforms() -> [PlatformEnum] {
        switch self.get(.platform) {
        case .platforms(let col): return col.getKeys()
        default: return []
        }
    }
    
    public func getFormats(_ p: PlatformEnum) -> FormatCollection {
        switch self.get(.platform) {
        case .platforms(let col): return col.getValues(p)
        default: return []
        }
    }
    
    public var allEnums: [PropertyEnum] {
        let inputs: [PropertyEnum] = InputEnum.all.flatMap { input in self.getInputs(input).map { .input(input, $0) } }
        let modes: [PropertyEnum] = self.getModes().map { .mode($0) }
        let platforms: [PropertyEnum] = self.getPlatforms().flatMap { platform in self.getFormats(platform).map { .platform(platform, $0) } }
        return [inputs, modes, platforms].flatMap { $0 }
    }
    
    public var count: Int { self.allEnums.count }

//    public func insert(_ i: InputEnum, _ str: String) -> Void {
//        let key: KeyEnum = i.keyEnum
//        let value: ValueEnum = self.get(key)
//        self.dictionary[key] = value.insert(i, str)
//    }
//    
//    public func insert(_ m: ModeEnum) -> Void {
//        self.dictionary[.mode] = self.get(.mode).insert(m)
//    }
//    
//    public func insert(_ p: PlatformEnum, _ f: FormatEnum) -> Void {
//        self.dictionary[.platform] = self.get(.platform).insert(p, f)
//    }
//    
//    public func remove(_ i: InputEnum, _ index: Int) -> Void {
//        let key: KeyEnum = i.keyEnum
//        let value: ValueEnum = self.get(key)
//        self.dictionary[key] = value.remove(i, index)
//    }
//    
//    public func remove(_ m: ModeEnum) -> Void {
//        self.dictionary[.mode] = self.get(.mode).remove(m)
//    }
//    
//    public func remove(_ p: PlatformEnum, _ index: Int) -> Void {
//        self.dictionary[.platform] = self.get(.platform).remove(p, index)
//    }
//    
//    public func remove(_ index: Int) -> Void {
//        self.dictionary[.platform] = self.get(.platform).remove(index)
//    }
    
}

//public class PropertyCollection: CollectionProtocol {
//    
//    @Published public var inputs: InputCollection = [:]
//    @Published public var modes: ModeCollection = []
//    @Published public var platforms: PlatformCollection = [:]
//    
//    public init() { }
//    
//    public init(_ props: [PropertyEnum]) {
//        self.inputs = .initialize(props)
//        self.modes = .initialize(props)
//        self.platforms = .initialize(props)
//    }
//    
//    public func getKeys(_ i: InputEnum) -> [String] {
//        self.inputs.getValues(i).getKeys()
//    }
//    
//    public func getValues(_ i: InputEnum) -> [String] {
//        self.inputs.getValues(i).getValues()
//    }
//    
//    public func removeInput(_ i: InputEnum, _ index: Int) -> Void {
//        self.inputs = self.inputs.removeInput(i, index)
//    }
//    
//    public func insertInput(_ i: InputEnum, _ s: String) -> Void {
//        self.inputs = self.inputs.insertInput(i, s)
//    }
//    
////
////    public func getModes() -> ModeCollection {
////        self.modes.getValues()
////    }
////
////    public func getPlatform(_ p: PlatformEnum) -> FormatCollection {
////        self.platforms.getValues(p)
////    }
//    
//    
//}
