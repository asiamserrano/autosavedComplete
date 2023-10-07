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
    
    init?(_ formEn: String?, _ formatEn: String?) {
        if let f: FormEnum = .init(formEn) {
            switch f {
            case .digital: self.init(digital: formatEn)
            case .physical: self.init(physical: formatEn)
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
        hasher.combine(self.child)
    }
    
    public var primaryEnum: PrimaryEnum { self.child.primaryEnum }
    
    public func get(_ v: Property.Variable) -> String? {
        switch v {
        case .identity: return nil
        case .primary: return self.primaryEnum.key
        case .secondary: return self.child.formEnum.key
        case .search: return self.child.search
        case .display: return self.child.display
        }
    }
    
//    public var primary: String { self.child.primaryEnum.key }
//    public var secondary: String { self.child.formEnum.key }
//    public var search: String { self.child.search }
//    public var display: String { self.child.display }
    
}
