//
//  Value+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/9/23.
//

import Foundation

public enum ValueEnum {
    
    case string(String?)
    case strings(StringCollection)
    case modes(ModeCollection)
    case platforms(PlatformCollection)
    
//    public func getInputs(_ i: InputEnum) -> [String] {
//        switch self {
//        case .string(let s): do {
//            if let string: String = s { return [string] }
//            else { return [] }
//        }
//        case .strings(let s): return s.getValues()
//        default: return []
//        }
//    }
//    
//    public func getModes() -> [ModeEnum] {
//        switch self {
//        case .modes(let col): return col.sorted()
//        default: return []
//        }
//    }
//    
//    public func getPlatforms() -> [PlatformEnum] {
//        switch self {
//        case .platforms(let col): return col.getKeys()
//        default: return []
//        }
//    }
//    
//    public func getFormats(_ p: PlatformEnum) -> FormatCollection {
//        switch self {
//        case .platforms(let col): return col.getValues(p)
//        default: return []
//        }
//    }
    
    public func insert(_ i: InputEnum, _ str: String) -> Self {
        let trimmed: String = str.trimmed
        switch self {
        case .string(_): return .string(trimmed)
        case .strings(let d): return .strings(d.insertString(trimmed))
        default: return self
        }
    }
    
    public func insert(_ m: ModeEnum) -> Self {
        switch self {
        case .modes(let ms): return .modes(ms.insertMode(m))
        default: return self
        }
    }
    
    public func insert(_ p: PlatformEnum, _ f: FormatEnum) -> Self {
        switch self {
        case .platforms(let ps): return .platforms(ps.insertPlatform(p, f))
        default: return self
        }
    }
    
    public func remove(_ i: InputEnum, _ index: Int) -> Self {
        switch self {
        case .string(_): return .string(nil)
        case .strings(let d): return .strings(d.removeString(index))
        default: return self
        }
    }
    
    public func remove(_ m: ModeEnum) -> Self {
        switch self {
        case .modes(let ms): return .modes(ms.removeMode(m))
        default: return self
        }
    }
    
    public func remove(_ p: PlatformEnum, _ index: Int) -> Self {
        switch self {
        case .platforms(let ps): return .platforms(ps.removeFormat(p, index))
        default: return self
        }
    }
    
    public func remove(_ index: Int) -> Self {
        switch self {
        case .platforms(let ps): return .platforms(ps.removePlatform(index))
        default: return self
        }
    }
    
}
