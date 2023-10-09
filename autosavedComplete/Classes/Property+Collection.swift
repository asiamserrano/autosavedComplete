//
//  Property+Collection.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/8/23.
//

import Foundation

public class PropertyCollection: CollectionProtocol {
    
    @Published public var inputs: InputCollection = [:]
    @Published public var modes: ModeCollection = []
    @Published public var platforms: PlatformCollection = [:]
    
    public init() { }
    
    public init(_ props: [PropertyEnum]) {
        self.inputs = .initialize(props)
        self.modes = .initialize(props)
        self.platforms = .initialize(props)
    }
    
    public func getKeys(_ i: InputEnum) -> [String] {
        self.inputs.getValues(i).getKeys()
    }
    
    public func getValues(_ i: InputEnum) -> [String] {
        self.inputs.getValues(i).getValues()
    }
    
    public func removeInput(_ i: InputEnum, _ index: Int) -> Void {
        self.inputs = self.inputs.removeInput(i, index)
    }
    
    public func insertInput(_ i: InputEnum, _ s: String) -> Void {
        self.inputs = self.inputs.insertInput(i, s)
    }
    
//
//    public func getModes() -> ModeCollection {
//        self.modes.getValues()
//    }
//
//    public func getPlatform(_ p: PlatformEnum) -> FormatCollection {
//        self.platforms.getValues(p)
//    }
    
    
}
