//
//  DummyTestInputView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/9/23.
//

import SwiftUI

struct DummyTestInputView: View {
    
    @FetchRequest var inputs: FetchedResults<Property>
    
    @State var predicate: NSPredicate
    
    let inputEnum: InputEnum
    
    init(predicate: NSPredicate, input: InputEnum) {
        let inputPredicate: NSPredicate = .init(.secondary, input.key, .equal)
        let pred: NSCompoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [inputPredicate, predicate])
        self.inputEnum = input
        self._predicate = .init(wrappedValue: pred)
        self._inputs = FetchRequest<Property>(sortDescriptors: [], predicate: pred)
    }
    
    var body: some View {
        if !self.inputs.isEmpty {
            Section(content: {
                ForEach(self.inputs) { input in
                    Text(input.get(.display)!)
                }
            }, header: {
                NavigationLink(destination: {
                    DummyAddInputView(predicate: self.predicate, input: self.inputEnum)
                }, label: {
                    HStack(alignment: .center, spacing: 8) {
                        Text(self.inputEnum.display).font(.footnote)
                        IconView("plus.circle.fill", .green, 18)
                    }
                })
            })
        }
    }
    
}
