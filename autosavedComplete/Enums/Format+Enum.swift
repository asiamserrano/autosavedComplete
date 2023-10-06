//
//  Format+Enum.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public enum FormatEnum: IdentifiableProtocol {
    
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

extension FormatEnum {
    
    public enum FormEnum: IterableProtocol {
        
        case digital, physical
                
        public var icon: String {
            switch self {
            case .digital: return "arrow.down.circle.fill"
            case .physical: return "opticaldisc.fill"
            }
        }
        
    }
    
    public enum DigitalEnum: IterableProtocol {
        
        public static var defaultFormat: FormEnum  { .digital }
        
        case steam, origin, psn, xbox, nintendo, file
        
        public var value: String {
            switch self {
            case .psn: return "Playstation Network"
            case .xbox: return "Xbox Live"
            case .nintendo: return "Nintendo eShop"
            case .file: return "System File"
            case .origin: return "Origin"
            case .steam: return "Steam"
            }
        }
        
    }
    
    public enum PhysicalEnum: IterableProtocol {
        
        public static var defaultFormat: FormEnum { .physical }

        case disc, cartridge, card
    }
    
}
