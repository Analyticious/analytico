/**
        Analytico - Simple analytics engine
 
    This file represents base Analytico interface
 
    Copyright (C) 2022 Veljko Tekelerovic
    MIT License
 
    PGP: 6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0
 
    Date created: 08/29/2022
 */

import Foundation

public struct SessionEntry: CustomDebugStringConvertible {
    private var date: Date
    
    var type: EventType
    var metaData: String?
    
    init() {
        date = Date()
        type = .systemEvent(.appStart)
    }
    
    init(type: EventType, metaData: String?) {
        date = Date()
        self.type = type
        self.metaData = metaData
    }
    
    public var debugDescription: String {
        "\(date.description) - Entry: \(type), meta: \(metaData ?? "")"
    }
}

/// `Analytico` main interface
public struct Analytico {
    private static let session: SessionStorage = SessionStorage.shared()

    static func startSession() {
        // setup session stack
        session.markSessionStart()
    }
    
    /// Adds a given entry to the session log
    static func trace(entry: SessionEntry) {
        session.add(entry)
    }
    
    static func collect() -> String { //throws ->
        session.readAllEntries()
    }
}
