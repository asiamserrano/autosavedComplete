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
    
    public func insertInput(_ i: InputEnum, _ str: String?) -> Void {
        if let string: String = str {
            self.collection.insertInput(i, string)
        }
    }
    
    public func removeInput(_ i: InputEnum, _ index: Int) -> Void {
        self.collection.removeInput(i, index)
    }
    
    public func getValues(_ i: InputEnum) -> [String] {
        self.collection.getValues(i)
    }
    
}
