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
    
    /*
     public var formEnum: FormEnum {
         self.child.formEnum
     }

     public var key: String {
         self.child.key
     }

     public var search: String {
         self.child.search
     }

     public var display: String {
         self.child.display
     }

     public var icon: String {
         self.child.icon
     }
     */
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(FormatEnum.all) { item in
                        VStack(alignment: .leading) {
                            FormView("primary_enum", item.primary)
                            FormView("secondary_enum", item.secondary)
                            FormView("search_string", item.search)
                            FormView("display_string", item.display)
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
