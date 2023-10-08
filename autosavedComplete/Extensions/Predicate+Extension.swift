//
//  Predicate+Extension.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/6/23.
//

import Foundation
import CoreData

public enum PredicateEnum: String {
    case equal = "=="
    case begin = "BEGINSWITH"
    case contain = "CONTAINS"
}

extension NSCompoundPredicate {
    
    public static func queryForProperty(_ builder: any PropertyProtocol) -> Self {
        let keys: [Property.Variable] = [.primary, .secondary, .search ]
        return .init(andPredicateWithSubpredicates: keys.map { .init($0, builder.get($0), .equal) } )
    }
    
    public static func queryForGame(_ builder: GameBuilder) -> Self {
        .init(andPredicateWithSubpredicates: [
            .init(.search, builder.search, .equal),
            .init(.release, builder.released, .equal)
        ] )
    }
    
    public static func andPredicate(_ arr: [NSPredicate]) -> Self {
        Self.init(andPredicateWithSubpredicates: arr)
    }
    
}

extension NSPredicate {
    
    public convenience init(_ v: Game.Variable, _ dt: Date, _ pred: PredicateEnum) {
        self.init(format: "\(v.rawValue) \(pred.rawValue) %@", dt as NSDate)
    }
    
    public convenience init(_ v: Game.Variable, _ string: String, _ pred: PredicateEnum) {
        self.init(v.rawValue, string, pred)
    }
    
    public convenience init(_ v: Property.Variable, _ string: String?, _ pred: PredicateEnum) {
        self.init(v.rawValue, string, pred)
    }
    
    public convenience init(_ v: Property.Variable, _ uuid: UUID, _ pred: PredicateEnum) {
        self.init(v.rawValue, uuid, pred)
    }
    
    public convenience init(_ v: Relation.Variable, _ uuid: UUID, _ pred: PredicateEnum) {
        self.init(v.rawValue, uuid.uuidString, pred)
    }
    
    public convenience init(_ v: String, _ uuid: UUID, _ pred: PredicateEnum) {
        self.init(v, uuid.uuidString, pred)
    }
    
    public convenience init(_ v: String, _ string: String?, _ pred: PredicateEnum) {
        let form: String = "\(v) \(pred.rawValue)"
        if let str: String = string {
            self.init(format: "\(form) %@", str.trimmed)
        } else {
            self.init(format: "\(form) nil")
        }
    }
    
}
