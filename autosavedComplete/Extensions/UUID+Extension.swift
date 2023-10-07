//
//  UUID+Extension.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/6/23.
//

import Foundation

extension UUID {
    
    public init(_ uuid: String?) {
        if let u: String = uuid, let new: Self = .init(uuidString: u) {
            self = new
        } else { self = .init() }
    }
    
    public init(_ uuid: UUID?) {
        self.init(uuid?.uuidString)
    }
    
}
