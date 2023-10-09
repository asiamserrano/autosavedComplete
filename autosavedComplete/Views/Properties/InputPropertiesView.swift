////
////  InputPropertiesView.swift
////  autosavedComplete
////
////  Created by Asia Serrano on 10/8/23.
////
//
//import SwiftUI
//
//struct InputPropertiesView: View {
//  
//    @Binding var editMode: EditMode
//    @ObservedObject var collection: PropertyCollection
//
//    private var editing: Bool { self.editMode.isEditing }
//
//    let input: InputEnum
//    
//    init(_ input: InputEnum, _ edit: Binding<EditMode>, _ c: PropertyCollection) {
//        self.input = input
//        self.collection = c
//        self._editMode = edit
//    }
//    
//    var body: some View {
//        let bool: Bool = !self.editing
//        Section(content: {
//            List {
//                ForEach(self.dict.getValues(self.input), id:\.self) {
//                    Text($0).tag($0)
//                }.onDelete(perform: self.delete)
//            }
//        }, header: {
//            NavigationLink(destination: {
//                AddInputPropertyView(self.input, dict)
//                    .navigationBarBackButtonHidden(true)
//            }, label: {
//                HStack(alignment: .center, spacing: 8) {
//                    Text(self.input.display).font(.footnote)
//                    IconView("plus.circle.fill", .green, 18).hide(bool)
//                }
//            })
//            .disabled(bool)
//            .foregroundColor(bool ? .gray : .blue)
//        })
//    }
//    
//    private func delete(_ off: IndexSet) -> Void {
//        off.forEach { self.dict.removeInput(self.input, $0) }
//    }
//
//    
//}
