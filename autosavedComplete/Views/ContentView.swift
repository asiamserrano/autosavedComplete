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

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    private var primaries: [PrimaryEnum] {
        [.mode, .platform, .format, .input]
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(self.primaries) { item in
                        VStack(alignment: .leading) {
                            FormView("key", item.key)
                            FormView("search", item.search)
                            FormView("display", item.display)
                        }
                    }
                }
                Section {
                    ForEach(ModeEnum.all) { item in
                        VStack(alignment: .leading) {
                            FormView("key", item.key)
                            FormView("search", item.search)
                            FormView("display", item.display)
                        }
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
