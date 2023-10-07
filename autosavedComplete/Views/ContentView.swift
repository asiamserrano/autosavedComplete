//
//  ContentView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest( sortDescriptors: [])
    private var properties: FetchedResults<Property>
    
    @FetchRequest(sortDescriptors: [])
    private var games: FetchedResults<Game>
    
    @FetchRequest(sortDescriptors: [])
    private var relations: FetchedResults<Relation>

    var body: some View {
        NavigationStack {
            List {
                Section {
                    FormView("# of games", self.games.count)
                    FormView("# of properties", self.properties.count)
                    FormView("# of relations", self.relations.count)
//                    ForEach(self.games, id:\.self) { game in
//                        VStack(alignment: .leading) {
//                            FormView("display", game.display_string)
//                            FormView("release", game.release_date!)
//                            FormView("identity", game.identity_uuid!)
//                        }
//                    }
                }
//                Section {
//                    ForEach(self.properties, id:\.self) { prop in
//
//                        NavigationLink(destination: { TestPropertyView(property: prop) }, label: {
//                            Text(prop.identity.uuidString.canonicalized)
//                        })
////                        let item: PropertyBuilder = prop.builder
////                        VStack(alignment: .leading) {
////                            FormView("identity_uuid", item.identity)
////                            FormView("primary_enum", item.get(.primary))
////                            FormView("secondary_enum", item.get(.secondary))
////                            FormView("search_string", item.get(.search))
////                            FormView("display_string", item.get(.display))
////                        }
//                    }
//                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
