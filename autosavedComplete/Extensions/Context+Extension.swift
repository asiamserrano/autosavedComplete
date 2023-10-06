//
//  Context+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation
import CoreData

public typealias Context = NSManagedObjectContext

extension Context {
    
    @discardableResult
    public func store() -> Bool {
        do {
            try self.save()
            return true
        } catch {
            self.rollback()
            return false
        }
    }
    
}
