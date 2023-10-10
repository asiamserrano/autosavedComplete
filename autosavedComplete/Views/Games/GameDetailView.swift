//
//  GameDetailView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import SwiftUI

struct GameDetailView: GameModifiableProtocol {
    
    @Environment(\.managedObjectContext) public var viewContext
    @Environment(\.presentationMode) public var presentationMode
    
    @StateObject var collection: PropertyCollection = .init()

    @State var editMode: EditMode
    @State var title: String
    @State var released: Date
    @State var image: Data?
    @State var old: GameBuilder?
    
//    @State var close: Bool = false
    
    let status: Bool
    
    init(_ builder: GameBuilder?, _ s: Bool, _ props: [PropertyEnum]) {
        self.status = s
        self._old = .init(wrappedValue: builder)
        self._collection = .init(wrappedValue: .init(props))
        self._editMode = .init(wrappedValue: builder == nil ? .active : .inactive)
        self._title = .init(wrappedValue: builder?.title ?? .empty)
        self._released = .init(wrappedValue: builder?.released ?? .today)
        self._image = .init(wrappedValue: builder?.image)
    }
    
    var body: some View {
        Form {
            FormView("properties count", self.collection.count)
            
            Section {
                if self.editing {
                    ClearableTextField($title)
                    DatePicker(selection: $released, displayedComponents: .date) {
                        Text("Release Date")
                    }
                } else {
                    FormView("Title", self.title)
                    FormView("Release", self.released.long)
                    if let s: String = self.series {
                        FormView(InputEnum.series.display, s)
                    }
                }
            }
            
//            Section {
//                ForEach(self.collection.allEnums) {
//                    PropertyEnumView($0)
//                }
//            }
            
            ForEach(self.inputEnums, id:\.self) { InputPropertiesView($0, $editMode, collection) }
//            ModesView($editMode, dict)
//            PlatformsView($editMode, dict)

        }
//        .onChange(of: self.close, perform: self.closed)
//        .alert(isPresented: self.$alertObj.show) { self.alertObj.alert }
//        .navigationBarBackButtonHidden(self.editing)
        .environment(\.editMode, $editMode)
        .toolbar {

//            ToolbarItem(placement: .navigationBarLeading) {
//                Button("Cancel", action: self.cancel).hide(!self.editing)
//            }

//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button(self.buttonName, action: self.buttonAction)
//                    .disabled(self.isDoneDisabled)
//            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(self.buttonName, action: self.toggleEdit)
//                    .disabled(self.isDoneDisabled)
            }
        }

    }
    
    @ViewBuilder
    public func PropertyEnumView(_ item: PropertyEnum) -> some View {
//        Text("An item")
        switch item {
        case .input(let i): FormView(i.get(.secondary), i.get(.display))
        case .mode(let m): FormView(m.get(.primary), m.get(.display))
        case .platform(let p, let f): FormView(p.get(.display), f.get(.display))
        }
    }
    
    @ViewBuilder
    public func PropertyBuilderView(_ item: any BuilderProtocol) -> some View {
        VStack(alignment: .leading) {
            FormView("identity_uuid", item.identity)
            FormView("primary_enum", item.get(.primary))
            FormView("secondary_enum", item.get(.secondary))
            FormView("search_string", item.get(.search))
            FormView("display_string", item.get(.display))
        }
    }
}

extension GameDetailView {
    
    var new: GameBuilder {
        .init()
        .withTitle(self.title)
        .withRelease(self.released)
        .withStatus(self.status)
        .withImage(self.image)
    }
    
    func toggleEdit() -> Void {
        self.editMode = self.editing ? .inactive : .active
    }
    
//    func toggleAlert(_ str: String, _ successful: Bool) -> Void {
//        self.alertObj.toggle(str, .build(successful, self.adding))
//        self.close = successful
//    }
    
//    func cancel() -> Void {
//        if let game: GameBuilder = self.old {
//            self.title = game.title
//            self.release = game.release
//            self.image = game.image
//            self.dict.update(game)
//            self.toggleEdit()
//        } else {
//            self.close = true
//        }
//    }
    
}
