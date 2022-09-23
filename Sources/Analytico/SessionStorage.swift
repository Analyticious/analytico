/**
        Analytico - Simple analytics engine
 
    This file represents shared session storage implementation
 
    Copyright (C) 2022 Veljko Tekelerovic
    MIT License
 
    PGP: 6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0
 
    Date created: 08/29/2022
 */
import Fridge

internal class SessionStorage {
    private static var _storage: SessionStorage { SessionStorage() }
    
    // internal session compartment
    private var sessionContainer: [SessionEntry]
    private let OBJECT_IDENTIFIER = "analytico"
    
    private init() {
        // Load from Fridge here, if the laoding fails, create brand new session and add first entry
        do {
            sessionContainer = try Fridge.unfreeze🪅🎉(OBJECT_IDENTIFIER)
        } catch let e {
            print("Unable to initialize SessionStorage, reason: \(e).\nContinuing with empty session.")
            sessionContainer = []
        }
        
        print("SessionStorage initialized. Entries: \(sessionContainer.count)")
    }
    
    /// Adds default entry marking session start
    func markSessionStart() {
        let start = SessionEntry(type: .systemEvent(.appStart), metaData: nil)
        sessionContainer.append(start)
        commit()
    }
    
    func add(_ entry: SessionEntry) {
        sessionContainer.append(entry)
        commit()
    }
    
    private func commit() {
        //save current session container
        do{
            try Fridge.freeze🧊(sessionContainer, id: OBJECT_IDENTIFIER)
        } catch {
            print("UNABLE TO COMMIT")
        }
    }
    
    func readAllEntries() -> String {
        return sessionContainer.description
    }
    
    /// Singleton access
    class func shared() -> SessionStorage {
        return _storage
    }
}
