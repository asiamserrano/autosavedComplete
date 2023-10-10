//
//  DummyAddInputView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/9/23.
//

import SwiftUI

struct DummyAddInputView: View {
    
    @FetchRequest var inputs: FetchedResults<Property>
        
    @State var listId: UUID = .init()
    
    let inputEnum: InputEnum
    
    init(predicate: NSPredicate, input: InputEnum) {
        self.inputEnum = input
        let sort: [NSSortDescriptor] = [.buildForProperty(.display, true)]
        let selectedPred: NSPredicate = NSCompoundPredicate(notPredicateWithSubpredicate: predicate)
        let pred: NSPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [selectedPred, .init(.secondary, input.key, .equal)])
        self._inputs = FetchRequest<Property>(sortDescriptors: sort, predicate: pred)
    }

    var body: some View {
        List {
            ForEach(self.inputs) { input in
                Text(input.get(.display)!)
            }
        }.id(self.listId)
    }
    
}
