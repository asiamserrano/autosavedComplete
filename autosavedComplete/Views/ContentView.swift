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
    
    @State var entityEnum: EntityEnum = .game
    
    @ViewBuilder
    public var GamesView: some View {
        ForEach(self.games, id:\.self) { game in
            NavigationLink(destination: {
                GameView(game)
            }, label: {
                GameListView(game)
            })
//            VStack(alignment: .leading) {
//                FormView("identity_uuid", game.identity)
//                FormView("search_string", game.search)
//                FormView("display_string", game.display)
//                FormView("release_date", game.released)
//                FormView("add_date", game.added)
//                FormView("status_boolean", game.status)
//                FormView("image_data", game.image)
//            }
        }
    }
    
    @ViewBuilder
    public var PropertiesView: some View {
        ForEach(self.properties, id:\.self) { item in
            VStack(alignment: .leading) {
                FormView("identity_uuid", item.identity)
                FormView("primary_enum", item.get(.primary))
                FormView("secondary_enum", item.get(.secondary))
                FormView("search_string", item.get(.search))
                FormView("display_string", item.get(.display))
            }
        }
    }
    
    @ViewBuilder
    public var RelationsView: some View {
        ForEach(self.relations, id:\.self) { rel in
            VStack(alignment: .leading) {
                FormView("game_uuid", rel.get(.game))
                FormView("primary_property_uuid", rel.get(.primary))
                FormView("secondary_property_uuid", rel.get(.secondary))
            }
        }
    }
    
    @ViewBuilder
    public func TopSectionView(_ count: Int) -> some View {
        FormView("# of \(self.entityEnum.display)", count)
    }
    
    @State var listUUID: UUID = .init()

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Picker("Entity Enum", selection: $entityEnum) {
                    ForEach(EntityEnum.all) { en in
                        Text(en.display).tag(en)
                    }
                }
                List {
                    Section {
                        switch self.entityEnum {
                        case .game: TopSectionView(self.games.count)
                        case .property: TopSectionView(self.properties.count)
                        case .relation: TopSectionView(self.relations.count)
                        }
                    }
                    
                    Section {
                        switch self.entityEnum {
                        case .game: GamesView
                        case .property: PropertiesView
                        case .relation: RelationsView
                        }
                    }
                }
                
            }
            .id(self.listUUID)
//            .onAppear(perform: self.refresh)
        }
    }
    
    public func refresh() -> Void {
        self.listUUID = .init()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
