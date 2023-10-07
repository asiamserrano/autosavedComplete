//
//  Property+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public protocol PropertyProtocol: IdentifiableProtocol {
    
//    var primaryEnum: PrimaryEnum { get }
    
    var primary: String { get }
    var secondary: String { get }
    var search: String { get }
    var display: String { get }
    
}
