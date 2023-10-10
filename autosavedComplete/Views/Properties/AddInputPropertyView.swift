//
//  AddPropertyInputView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import SwiftUI

struct AddInputPropertyView: PropertyModifiableProtocol {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var viewDismiss
//    @Environment(\.presentationMode) var presentationMode
    
    //    @EnvironmentObject var viewObject: ViewObject
    
    @State var dismiss: Bool = false
    @State var search: String = .init()
    @State var selected: String? = nil
    
    private let uuid: UUID = .init()
    
    @ObservedObject var collection: PropertyCollection
    
    private var inputEnum: InputEnum
    
    init(_ i: InputEnum, _ c: PropertyCollection) {
        self.inputEnum = i
        self.collection = c
        
        if i == .series, let val: String = c.getInputs(.series).first {
            self._selected = .init(wrappedValue: val)
        }
    }
    
    private var fetchRequest: [Property] {
        self.viewContext.fetchProperties(self.inputEnum, $search)
    }
    
    private var trimmed: String { self.search.trimmed }
    private var canonicalized: String { self.search.canonicalized }
    
    private var showAddButton: Bool {
        self.canonicalized.isEmpty ? false : self.viewContext.queryProperty(.forInputBuilder(.init(self.inputEnum, self.trimmed))) == nil
    }
    
    private var prompt: String {
        let title: String = self.inputEnum.display.lowercased()
        let front: String = self.fetchRequest.isEmpty ? "Add" : "Search or add"
        return "\(front) new \(title)"
    }
    
    
    var body: some View {
        List {
            
            if self.showAddButton {
                Section {
                    Button(action: {
                        self.selected = self.trimmed
                        self.done()
                    }, label: {
                        Text("Add '\(self.trimmed)'")
                    })
                }
            }

            ForEach(self.fetchRequest) { property in
                if let item: String = property.get(.display) {
                    let bool: Bool = self.selected == item
                    Button(action: {
                        self.selected = bool ? nil : item
                    }, label: { CheckMarkView(item, bool) })
                }
            }
            
        }
        .id(self.uuid)
        .listStyle(.insetGrouped)
        .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always), prompt: self.prompt)
        .onChange(of: self.dismiss, perform: self.close)
        .disableAutocorrection(true)
        .toolbar {
            
            ToolbarItem(placement:.navigationBarLeading) {
                Button("Cancel", action: {
                    self.selected = nil
                    self.done()
                })
            }
            
            ToolbarItem(placement:.navigationBarTrailing) {
                Button("Done", action: self.done)
                    .disabled(self.selected == nil)
            }
        }
    }
    
    private func done() -> Void {
        self.insertInput(self.inputEnum, self.selected)
        self.dismiss = true
    }
    
    private func close(_ bool: Bool) -> Void {
        if bool { self.viewDismiss() }
//        if bool { self.presentationMode.wrappedValue.dismiss() }
    }
    
}
