//
//  Collection+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation
import SwiftUI
 
public protocol CollectionProtocol: ObservableObject {
    
    var inputs: InputCollection { get }
    var modes: ModeCollection { get }
    var platforms: PlatformCollection { get }
    
}

extension CollectionProtocol {
    
    public var count: Int {
        [ self.inputs.count, self.modes.count, self.platforms.count ].reduce(0, +)
    }
    
    public func getInput(_ i: InputEnum) -> StringCollection {
        self.inputs.getValues(i)
    }
    
    public func getModes() -> ModeCollection {
        self.modes.getValues()
    }
    
    public func getPlatform(_ p: PlatformEnum) -> FormatCollection {
        self.platforms.getValues(p)
    }
    
    public var allEnums: [PropertyEnum] {
        [ self.inputs.getEnums(), self.modes.getEnums(), self.platforms.getEnums() ] .flatMap { $0 }
    }
    
//    public var allBuilders: [PropertyBuilder] {
//        let i: [PropertyBuilder] = self.inputs.getKeys().flatMap { inputEn in
//            self.getInput(inputEn).getValues().map { .forInputBuilder(.init(inputEn, $0)) }
//        }
//        let m: [PropertyBuilder] = self.getModes().map { .forModeBuilder(.init($0)) }
//        let p: [PropertyBuilder] = self.platforms.getKeys().flatMap { platformEn in
//            self.getPlatform(platformEn).flatMap { [
//                .forPlatformBuilder(.init(platformEn), .init($0)),
//                .forFormatBuilder(.init(platformEn), .init($0)),
//            ] }
//        }
//        
//        return [i, m, p].flatMap { $0 }
//    }
    
}



//    var series: String? { get }
//    var developers: [String] { get }
//    var publishers: [String] { get }
//    var genres: [String] { get }
//    var modes: [ModeEnum] { get }
//    var platforms: PlatformDictionary { get }
//    
//    func get(_ p: PlatformEnum) -> FormatArray
//    
//}
//
//extension CollectionProtocol {
//    
//    public func getInput(_ i: InputEnum) -> [String] {
//        switch i {
//        case .series: if let s: String = self.series { return [s] } else { return [] }
//        case .developer: return self.developers
//        case .publisher: return self.publishers
//        case .genre: return self.genres
//        }
//    }
//    
//    public var builders: [PropertyEnum] {
//        [
//            InputEnum.all.flatMap { self.getInput($0).transform($0) },
//            self.modes.map { .mode(.init($0)) },
//            self.platforms.keys.sorted().flatMap { self.get($0).transform($0) }
//        ].flatMap { $0 }
//    }
//    
//}
