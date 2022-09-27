/**
        Analytico - Simple analytics engine
 
    This file represents shared session storage implementation
 
    Copyright (C) 2022 Veljko Tekelerovic
    MIT License
 
    PGP: 6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0
 
    Date created: 08/29/2022
 */
import Foundation
import Fridge

internal class SessionStorage {
    private static var _storage: SessionStorage { SessionStorage() }
    
    // internal session compartment
    private var sessionContainer: [EventTypes]
    private let OBJECT_IDENTIFIER = "analytico"
    
    private init() {
        // Load from Fridge here, if the loading fails, create brand new session and add first entry
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
        sessionContainer.append(.system(event: .appStart))
        commit()
    }
    
    func add(_ entry: EventTypes) {
        sessionContainer.append(entry)
        commit()
    }
    
    private func commit() {
        //save current session container
        do{
            try Fridge.freeze🧊(sessionContainer, id: OBJECT_IDENTIFIER)
        } catch {
            print("<SessionStorage> UNABLE TO COMMIT")
        }
    }
    
    func readAllEntries() -> String {
        // convert entries to JSON output
        guard let output = try? JSONEncoder().encode(sessionContainer) else {
            print("<SessionStorage> Unable to form JSON object. Aborting.")
            return ""
        }
        
        // create String out of encoded output
        guard let jsonString = String(data: output, encoding: .utf8) else {
            print("<SessionStorage> Unable to setup JSON string. Aborting.")
            return ""
        }
        
        return jsonString
    }
    
    /// Singleton access
    class func shared() -> SessionStorage {
        return _storage
    }
}
