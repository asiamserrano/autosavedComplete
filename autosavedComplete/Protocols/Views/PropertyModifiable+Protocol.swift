//
//  PropertyModifiable+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/9/23.
//

import Foundation
import SwiftUI

public protocol PropertyModifiableProtocol: View {
    
    var collection: PropertyCollection { get }

}

extension PropertyModifiableProtocol {
    
    private func get(_ key: KeyEnum) -> ValueEnum {
        self.collection.get(key)
    }
 
    public func insertInput(_ i: InputEnum, _ str: String?) -> Void {
        if let string: String = str {
            let key: KeyEnum = i.keyEnum
            let value: ValueEnum = self.get(key).insert(i, string)
            self.collection.put(key, value)
        }
    }
    
    public func removeInput(_ i: InputEnum, _ index: Int) -> Void {
        let key: KeyEnum = i.keyEnum
        let value: ValueEnum = self.get(key).remove(i, index)
        self.collection.put(key, value)
    }
    
    public func getValues(_ i: InputEnum) -> [String] {
        self.collection.getInputs(i)
    }
    
}
