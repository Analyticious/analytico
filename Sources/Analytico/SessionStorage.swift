/**
        Analytico - Simple analytics engine
 
    This file represents shared session storage implementation
 
    Copyright (C) 2022 Veljko Tekelerovic
    MIT License
 
    PGP: 6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0
 
    Date created: 08/29/2022
 */

internal class SessionStorage {
    private static var _storage: SessionStorage { SessionStorage() }
    
    // internal session compartment
    private var sessionContainer: [SessionEntry]
    
    private init() {
        // Load from Fridge here, if the laoding fails, create brand new session and add first entry
        sessionContainer = []
        print("SessionStorage initialized")
    }
    
    /// Adds default entry marking session start
    func markSessionStart() {
        let start = SessionEntry(type: .systemEvent(.appStart), metaData: nil)
        sessionContainer.append(start)
    }
    
    func add(_ entry: SessionEntry) {
        sessionContainer.append(entry)
    }
    
    func readAllEntries() -> String {
        return sessionContainer.description
    }
    
    /// Singleton access
    class func shared() -> SessionStorage {
        return _storage
    }
}
