# Analytico

Analytico is _super-simple analytics data getherer_ for iOS platform.    
It is written in pure `Swift 5`.  

As they said:  
> _Use it wisely_ ☝️

## Usage
Using `Analytico` is pretty darn simple. Because all you can do are following two things:
  - trace app specific events
  - collect traced events

And that's pretty much it... 🤷🏻‍♂️  

Here are some real world examples:
```Swift
// Mark app specific events like this
Analytico.trace(entry: .systemEvent(.appStart), metaData: "Testing app start trace")
Analytico.trace(entry: .systemEvent(.iOS.locationUpdate))

// Mark your screen visits this way
Analytico.trace(entry: .screenVisit(name: "Signup", metaData: nil)

// Mark your important events this way
Analytico.trace(entry: .event("Signup completed", metaData: "Method: AppleSignin")

// Granually trace your app usage
Analytico.trace(entry: .interaction("Help button clicked"))
```

Then, at some point, if you wish to use your gathered analytics data, just:
```Swift
Analytico.collect()
```

## Installation
`Analytico` can easily be installed using SPM.  

Quick links:  
> Package name: Analytico
> URL: https://github.com/vexy/analytico.git

Your `Package.swift` example:
```
let package = Package(
    name: "YOUR_PACKAGE",
    products: [
        // ....
    ],
    dependencies: [
        .package(url: https://github.com/vexy/analytico.git, branch: "main"),
    ],
    targets: [
        .target(
            name: "YOUR_TARGET_NAME",
            dependencies: ["Analytico"]
        ),
    ]
)
```

# Licence
`Analytico` has been published under `MIT Licence`.  
Check the LICENCE for more information.

---  
Copyright (C) 2022 Veljko Tekelerovic  
PGP: `6302 D860 B74C BD34 6482 DBA2 5187 66D0 8213 DBC0`
