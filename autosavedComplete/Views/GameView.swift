//
//  GameView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/7/23.
//

import SwiftUI

struct GameView: GameModifiableProtocol, View {
    
    @Environment(\.managedObjectContext) public var viewContext
    @Environment(\.presentationMode) public var presentationMode
    
    @FetchRequest var relations: FetchedResults<Relation>

//    @StateObject var dict: PropertyDictionary = .init()
//    @StateObject var alertObj: AlertObject = .init()

    @State var editMode: EditMode = .active
    @State var title: String = .init()
    @State var released: Date = .today
    @State var image: Data? = nil
    
//    @State var close: Bool = false
    
    @State var old: GameBuilder? = nil
    
    let status: Bool
    
    init(_ builder: GameBuilder? = nil, _ s: Bool = true, _ pred: NSPredicate? = nil) {
        _relations = FetchRequest<Relation>(sortDescriptors: [], predicate: pred)
        self.status = s
        self._old = .init(wrappedValue: builder)
    }

    init(_ game: Game) { self.init(.init(game)) }

    init(_ game: GameBuilder) {
//        print(String(describing: NSPredicate(.game, game.identity, .equal)))
//        self.init(game, game.status)
        self.init(game, game.status, .init(.game, game.identity, .equal))
        self._editMode = .init(wrappedValue: .inactive)
        self._title = .init(wrappedValue: game.title)
        self._released = .init(wrappedValue: game.released)
        self._image = .init(wrappedValue: game.image)
    }
    
    private var properties: [PropertyEnum] {
        self.viewContext.fetchProperties(self.relations)
    }

    var body: some View {
        Form {
            FormView("# or relations", self.relations.count)
//            if let b: GameBuilder = self.old {
//                FormView("properties count", b.builders.count)
//            }
            Section {
                if self.editing {
                    ClearableTextField($title)
                    DatePicker(selection: $released, displayedComponents: .date) {
                        Text("Release Date")
                    }
                } else {
                    FormView("Title", self.title)
                    FormView("Release", self.released.long)
//                    if let s: String = self.series {
//                        FormView(InputEnum.series.value, s)
//                    }
                }
            }
            
            
            Section {
                ForEach(self.properties, id:\.self, content: { propEnum in
                    PropertyEnumView(propEnum)
                })
            }
            
//            Section {
//                ForEach(self.properties, id:\.self) { item in
//                    VStack(alignment: .leading) {
//                        FormView("identity_uuid", item.identity)
//                        FormView("primary_enum", item.get(.primary))
//                        FormView("secondary_enum", item.get(.secondary))
//                        FormView("search_string", item.get(.search))
//                        FormView("display_string", item.get(.display))
//                    }
//                }
//            }

//            ForEach(self.inputEnums, id:\.self) { InputsView($0, $editMode, dict) }
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

extension GameView {
    
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
