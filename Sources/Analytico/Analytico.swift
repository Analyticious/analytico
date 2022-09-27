/**
        Analytico - Simple analytics engine
 
    This file represents base Analytico interface
 
    Copyright (C) 2022 Veljko Tekelerovic
    MIT License
 
    PGP: 6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0
 
    Date created: 08/29/2022
*/
import Foundation

/// `Analytico` main interface
public struct Analytico {
    private static let session: SessionStorage = SessionStorage.shared()

    static func startSession() {
        // setup session stack
        session.markSessionStart()
    }
    
    /// Traces specified event
    static func trace(_ entry: EventTypes, metaData: String? = nil) {
        session.add(entry)
    }
    
    static func collect() -> String { //throws ->
        session.readAllEntries()
    }
}
