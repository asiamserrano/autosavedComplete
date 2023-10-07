//
//  Format+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum FormatEnum {
    
    public static func random(_ form: FormEnum) -> Self {
        switch form {
        case .digital: return .digital(.random)
        case .physical: return .physical(.random)
        }
    }
    
    case digital(DigitalEnum)
    case physical(PhysicalEnum)
    
    init?(_ strA: String?, _ strB: String?) {
        if let f: FormEnum = .init(strA) {
            switch f {
            case .digital: self.init(digital: strB)
            case .physical: self.init(physical: strB)
            }
        } else { return nil }
    }
    
    private init?(digital: String?) {
        if let n: DigitalEnum = .init(digital) { self = .digital(n) }
        else { return nil }
    }
    
    private init?(physical: String?) {
        if let n: PhysicalEnum = .init(physical) { self = .physical(n) }
        else { return nil }
    }
    
}

extension FormatEnum: IterableProtocol {
    
    public static var allCases: [Self] {
        [
            DigitalEnum.all.map(Self.digital),
            PhysicalEnum.all.map(Self.physical)
        ].flatMap { $0 }
    }
    
}

extension FormatEnum: PropertyProtocol {
    
    private var child: any FormatProtocol {
        switch self {
        case .digital(let d): return d
        case .physical(let p): return p
        }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.className)
        hasher.combine(self.child.className)
        hasher.combine(self.child.key)
    }
    
    public var primary: String {
        self.child.primaryEnum.key
    }
    
    public var secondary: String {
        self.child.formEnum.key
    }
    
    public var search: String {
        self.child.search
    }
    
    public var display: String {
        self.child.display
    }
    
}
