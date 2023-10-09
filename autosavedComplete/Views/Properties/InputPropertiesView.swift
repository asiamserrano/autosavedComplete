//
//  InputPropertiesView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import SwiftUI

struct InputPropertiesView: PropertyModifiableProtocol {
  
    @Binding var editMode: EditMode
    @ObservedObject var collection: PropertyCollection

    private var isNotEditing: Bool { !self.editMode.isEditing }

    let input: InputEnum
    
    init(_ input: InputEnum, _ edit: Binding<EditMode>, _ c: PropertyCollection) {
        self.input = input
        self.collection = c
        self._editMode = edit
    }
    
    var body: some View {
        let values: [String] = self.getValues(self.input)
        if !values.isEmpty || !isNotEditing {
            Section(content: {
                List {
                    ForEach(values, id:\.self) {
                        Text($0).tag($0)
                    }.onDelete(perform: self.delete)
                }
            }, header: {
                NavigationLink(destination: {
//                    Text("TBD")
                    AddInputPropertyView(self.input, self.collection)
                        .navigationBarBackButtonHidden(true)
                }, label: {
                    HStack(alignment: .center, spacing: 8) {
                        Text(self.input.display).font(.footnote)
                        IconView("plus.circle.fill", .green, 18).hide(isNotEditing)
                    }
                })
                .disabled(isNotEditing)
                .foregroundColor(isNotEditing ? .gray : .blue)
            })
        }
       
    }
    
    private func delete(_ off: IndexSet) -> Void {
        off.forEach { self.removeInput(self.input, $0) }
    }

    
}
