//
//  Format+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation

public protocol FormatProtocol: IterableProtocol {
    
    static var formEnum: FormEnum  { get }
    
}

extension FormatProtocol {
    
    public var icon: String {
        Self.formEnum.icon
    }
    
    public var formEnum: FormEnum {
        Self.formEnum
    }
    
    public var primaryEnum: PrimaryEnum {
        .format
    }
    
}
