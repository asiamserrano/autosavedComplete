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
    
//    @State var predicate: NSPredicate
    
    let predicate: NSPredicate
    
//    private var isEditing: Bool { self.editMode }
    
    init(relations: FetchedResults<Relation>) {
        let predicates: [NSPredicate] = relations.flatMap { [$0.get(.primary), $0.get(.secondary)] }.filter { $0 != nil }.map { .init(.identity, $0!, .equal) }
        let pred: NSCompoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
        self.predicate = pred
//        self._predicate = .init(wrappedValue: pred)
    }
    
    var body: some View {
        Form {
            ForEach(InputEnum.all) { input in
                DummyTestInputView(predicate: self.predicate, input: input)
            }
        }.toolbar {
            ToolbarItem(placement: .topBarTrailing) { EditButton() }
        }
    }
    
//    @ViewBuilder
//    public func PropertyView(_ property: Property) -> some View {
//        VStack(alignment: .leading) {
//            FormView("identity_uuid", property.identity)
//            FormView("primary_enum", property.get(.primary))
//            FormView("secondary_enum", property.get(.secondary))
//            FormView("search_string", property.get(.search))
//            FormView("display_string", property.get(.display))
//        }
//    }
//    
//    @ViewBuilder
//    public func PropertyEnumView(_ item: PropertyEnum) -> some View {
//        switch item {
//        case .input(let i): FormView(i.get(.secondary), i.get(.display))
//        case .mode(let m): FormView(m.get(.primary), m.get(.display))
//        case .platform(let p, let f): FormView(p.get(.display), f.get(.display))
//        }
//    }
    
//    @ViewBuilder
//    public func RelationView(_ relation: Relation) -> some View {
//        VStack(alignment: .leading) {
//            FormView("game", relation.get(.game))
//            FormView("primary", relation.get(.primary))
//            FormView("secondary", relation.get(.secondary))
//        }
//    }
    
}
