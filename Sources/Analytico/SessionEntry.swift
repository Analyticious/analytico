
/**
        Analytico - Simple analytics engine
 
    This file represents base Analytico interface
 
    Copyright (C) 2022 Veljko Tekelerovic
    MIT License
 
    PGP: 6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0
 
    Date created: 09/23/2022
 */
import Foundation

public struct SessionEntry: Codable, CustomDebugStringConvertible {
    private var date: Date
    
    var type: EventTypes
    var metaData: String?
    
    init() {
        date = Date()
        type = .system(event: .appStart)
    }
    
    init(type: EventTypes, metaData: String?) {
        date = Date()
        self.type = type
        self.metaData = metaData
    }
    
    public var debugDescription: String {
        "\(date.description) - Entry: \(type), meta: \(metaData ?? "")"
    }
}
