//
//  Italicized+Modifier.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation
import SwiftUI

struct ItalicizedModifier: ViewModifier {
    
    let isActive: Bool
    let color: Color
    
    init(_ b: Bool, _ c: Color) {
        self.color = c
        self.isActive = b
    }
    
    func body(content: Content) -> some View {
        content
            .italic(self.isActive)
            .foregroundColor(self.color)
    }
    
}
