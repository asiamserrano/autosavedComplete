//
//  DummyTestView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/9/23.
//

import SwiftUI

struct DummyTestView: View {
    
    @Environment(\.managedObjectContext) public var viewContext
    @Environment(\.editMode) public var editMode
    @Environment(\.dismiss) public var dismiss
        
    let predicate: NSPredicate
    
    init(relations: FetchedResults<Relation>) {
        let predicates: [NSPredicate] = relations.flatMap { $0.predicateForProperties }
        let pred: NSCompoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
        self.predicate = pred
    }
    
    var body: some View {
        Form {
            ForEach(InputEnum.all) { input in
                DummyTestInputView(predicate: self.predicate, input: input)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) { EditButton() }
        }
    }
    
}
