/**
        Analytico - Simple analytics engine
 
    This file represents base event type abstrction. Used for simpler tracing.
 
    Copyright (C) 2022 Veljko Tekelerovic
    MIT License
 
    PGP: 6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0
 
    Date created: 08/29/2022
 */

/// Common `SystemEvents` enum containing system-specific event types
public enum SystemEvents: Codable {
    case appStart
    case appForeground
    case appBackground
    
    /// iOS system event types
    enum iOS: Codable {
        case notification
        case locationUpdate
        case backgroundTask
        case payment
        
        //TODO: Add more later
    }
    
    /**
     TODO: Support other OS types
       - MacOS
       - watchOS
       - tvOS
     */
}

/// `Analytico.EventTypes` enum containing supported event types
public enum EventTypes: Codable {
    /// Sreen visit or appearance
    case screenVisit(name: String)
    
    /// Interaction with (_typically_) UI element of the app
    case interaction(`object`: String)
    
    /// Represents an abstract, _app-specific_ event. Example: "Subscription purchased"
    case event(name: String)
    
    /// Represents system-specific, predefined event
    case system(event: SystemEvents)
}
