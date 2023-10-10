//
//  Platform+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum PlatformEnum {
    
    public static func random(_ family: FamilyEnum) -> Self {
        switch family {
        case .nintendo: return .nintendo(.random)
        case .pc: return .pc(.random)
        case .playstation: return .playstation(.random)
        case .xbox: return .xbox(.random)
        }
    }
    
    case nintendo(NintendoEnum)
    case pc(PCEnum)
    case playstation(PlayStationEnum)
    case xbox(XboxEnum)
    
    init?(_ famEn: String?, _ platEn: String?) {
        if let f: FamilyEnum = .init(famEn) {
            switch f {
            case .nintendo: self.init(nintendo: platEn)
            case .pc: self.init(pc: platEn)
            case .playstation: self.init(playstation: platEn)
            case .xbox: self.init(xbox: platEn)
            }
        } else { return nil }
    }
    
    private init?(nintendo: String?) {
        if let n: NintendoEnum = .init(nintendo) { self = .nintendo(n) }
        else { return nil }
    }
    
    private init?(pc: String?) {
        if let n: PCEnum = .init(pc) { self = .pc(n) }
        else { return nil }
    }
    
    private init?(playstation: String?) {
        if let n: PlayStationEnum = .init(playstation) { self = .playstation(n) }
        else { return nil }
    }
    
    private init?(xbox: String?) {
        if let n: XboxEnum = .init(xbox) { self = .xbox(n) }
        else { return nil }
    }
    
//    public enum TypeEnum: IterableProtocol {
//        case handheld, console, hybrid, os
//
//        public var display: String {
//            switch self {
//            case .handheld: return "Handheld"
//            case .console: return "Console"
//            case .hybrid: return "Hybrid"
//            case .os: return "Operating System"
//            }
//        }
//    }
  
    
}

extension PlatformEnum: IterableProtocol {
    
    public static var allCases: [Self] {
        [
            NintendoEnum.all.map(Self.nintendo),
            PCEnum.all.map(Self.pc),
            PlayStationEnum.all.map(Self.playstation),
            XboxEnum.all.map(Self.xbox)
        ].flatMap { $0 }
    }
    
}

extension PlatformEnum: PropertyProtocol {
    
    private var child: any PlatformProtocol {
        switch self {
        case .nintendo(let n): return n
        case .pc(let pc): return pc
        case .playstation(let ps): return ps
        case .xbox(let x): return x
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.className)
        hasher.combine(self.child)
    }
    
    public var primaryEnum: PrimaryEnum {
        self.child.primaryEnum
    }
    
    public func get(_ v: Property.Variable) -> String? {
        switch v {
        case .identity: return nil
        case .primary: return self.primaryEnum.key
        case .secondary: return self.child.familyEnum.key
        case .search: return self.child.search
        case .display: return self.child.display
        }
    }
    
    public var physical: FormatEnum { .physical(self.child.physicalFormat) }
    public var digital: FormatCollection { self.child.digitalFormats.map (FormatEnum.digital) }
    public var keyEnum: KeyEnum { .mode }
    
}
