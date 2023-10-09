//
//  FormatCollection+Extension.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public typealias FormatCollection = [FormatEnum]

extension FormatCollection {
    
    public func transform(_ p: PlatformEnum) -> [PropertyEnum] {
        self.map { .platform(.init(p), .init($0)) }
    }
    
}
