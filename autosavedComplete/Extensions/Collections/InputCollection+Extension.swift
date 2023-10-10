////
////  InputCollection+Extension.swift
////  autosavedComplete
////
////  Created by Asia Serrano on 10/8/23.
////
//
//import Foundation
//
//public typealias InputCollection = [InputEnum: StringCollection]
//
//extension InputCollection {
//    
//    public static func initialize(_ arr: [PropertyEnum]) -> Self {
//        let new: [InputBuilder] = arr.filter {
//            $0.propertiesEnum == .input
//        }.map { .init($0.mainBuilder) }
//        return .initialize(new)
//    }
//    
//    public static func initialize(_ arr: [InputBuilder]) -> Self {
//        var new: Self = .init()
//        arr.forEach { new = new.insertInput($0.inputEnum, $0.display) }
//        return new
//    }
//
//    public func insertInput(_ i: InputEnum, _ s: String) -> Self {
//        var new: Self = self
//        new[i] = (i == .series ? .init() : self.getValues(i)).insertString(s)
//        return new
//    }
//    
//    public func removeInput(_ i: InputEnum, _ index: Int) -> Self {
//        var new: Self = self
//        new[i] = self.getValues(i).removeString(index)
//        return new
//    }
//    
//    public func getEnums(_ i: Key) -> [PropertyEnum] {
//        self.getValues(i).getValues().map { .input(.init(i, $0)) }
//    }
//    
//    public func getEnums() -> [PropertyEnum] {
//        self.getKeys().flatMap(self.getEnums)
//    }
//    
//    func getKeys() -> [Key] { self.keys.sorted() }
//    
//    func getValues(_ i: Key) -> Value { self[i] ?? .init() }
//    
//    func isEmpty(_ i: Key) -> Bool { self.getValues(i).isEmpty }
//    
//    func equals(_ other: Self) -> Bool {
//        if self.getKeys() == other.getKeys() {
//            for input in InputEnum.all {
//                let a: Value = self.getValues(input)
//                let b: Value = other.getValues(input)
//                if !a.equals(b) { return false }
//            }
//            return true
//        } else { return false }
//    }
//    
//    var isEmpty: Bool { self.getKeys().isEmpty }
//    
//    var count: Int { self.getKeys().map { self.getValues($0).count }.reduce(0, +) }
//    
//    
//    
//}
//
////public protocol InputCollectionProtocol {
////    
////    var inputs: InputCollection { get }
////    
////}
////
////public extension InputCollectionProtocol {
////    
////    var inputKeys: [InputEnum] {
////        self.inputs.keys.sorted()
////    }
////    
////    var isEmpty: Bool {
////        self.inputKeys.isEmpty
////    }
////    
////    func insertInput(_ i: InputEnum, _ s: String) -> InputCollection {
////        var new: InputCollection = self.inputs
////        var value: StringCollection = self.inputs[i] ?? .init()
////        new[i] = value.inser
////        return new
//////        self.remove(i, self.inputs[i]?[s.canonicalized])
//////        self.remove(i)
//////        self.insert(InputBuilder(i, s))
////    }
////    
//////    func getKeys(_ i: InputEnum) -> [String] {
//////        self.inputs[i]?.keys.sorted() ?? .init()
//////    }
//////    
//////    func getValues(_ i: InputEnum) -> [String] {
//////        self.inputs[i]?.values.sorted() ?? .init()
//////    }
////    
////    func isEmpty(_ i: InputEnum) -> Bool {
////        self.inputs[i]?.isEmpty ?? true
////    }
////    
////}
