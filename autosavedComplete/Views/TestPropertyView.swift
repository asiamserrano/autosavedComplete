//
//  TestPropertyView.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/7/23.
//

import SwiftUI

struct TestPropertyView: View {
    
    @ObservedObject var property: Property
    
    var body: some View {
        Form {
            Section("Property") {
                VStack(alignment: .leading) {
                    FormView("identity_uuid", self.property.identity)
                    FormView("primary_enum", self.property.get(.primary))
                    FormView("secondary_enum", self.property.get(.secondary))
                    FormView("search_string", self.property.get(.search))
                    FormView("display_string", self.property.get(.display))
                }
            }
            
            Section("Builder") {
                VStack(alignment: .leading) {
                    let item: PropertyBuilder = self.property.builder
                    FormView("identity_uuid", item.identity)
                    FormView("primary_enum", item.get(.primary))
                    FormView("secondary_enum", item.get(.secondary))
                    FormView("search_string", item.get(.search))
                    FormView("display_string", item.get(.display))
                }
            }
        }
    }
    
}

//struct TestPropertyView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestPropertyView()
//    }
//}
