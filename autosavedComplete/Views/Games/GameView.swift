//
//  GameView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/7/23.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.managedObjectContext) public var viewContext
    
    @FetchRequest var relations: FetchedResults<Relation>

    let old: GameBuilder?
    let status: Bool
    
    init(_ builder: GameBuilder? = nil, _ s: Bool = true, _ pred: NSPredicate? = nil) {
        _relations = FetchRequest<Relation>(sortDescriptors: [], predicate: pred)
        self.status = s
        self.old = builder
    }

    init(_ game: Game) {
        let builder: GameBuilder = .init(game)
        self.init(builder)
    }

    init(_ game: GameBuilder) {
        let status: Bool = game.status
        let predicate: NSPredicate = .init(.game, game.identity, .equal)
        self.init(game, status, predicate)
    }
    
//    public var properties: [PropertyEnum] {
//        self.viewContext.getPropertiesByRelations(self.relations)
//    }

    var body: some View {
        DummyTestView(relations: self.relations)
//        GameDetailView(self.old, self.status, self.properties)
//        Form {
//            
//            
//
////            if let oldBuilder: GameBuilder = self.old {
////                FormView("title", oldBuilder.title)
////            }
////            FormView("# or relations", self.relations.count)
//        }
    }
    
}


