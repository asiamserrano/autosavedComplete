//
//  Platform+Protocol.swift
//  autosavedComplete
//
//  Created by Asia Michelle Serrano on 10/6/23.
//

import Foundation

//public typealias PlatformFamily = PlatformEnum.FamilyEnum
//public typealias PlatformType = PlatformEnum.TypeEnum

public protocol PlatformProtocol: IterableProtocol {
    
    static var familyEnum: FamilyEnum { get }
//    static var allPlatforms: [PlatformEnum] { get }
    
//    var typeEnum: PlatformType { get }
    var physicalFormat: PhysicalEnum { get }
    var digitalFormats: [DigitalEnum] { get }
    
}

extension PlatformProtocol {
    
    public var physicalFormat: PhysicalEnum { .disc }
    public var primaryEnum: PrimaryEnum { .platform }
    public var familyEnum: FamilyEnum { Self.familyEnum }
    
}
